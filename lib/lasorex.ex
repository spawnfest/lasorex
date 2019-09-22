defmodule Lasorex do
  @moduledoc """
  Documentation for Lasorex.
  """
  alias Lasorex.{Scheduler, State, Frame, Tree}

  @q 113

  def btop do
    Application.ensure_started(:ex_ncurses)
    ExNcurses.n_begin()
    # Hides cursor
    ExNcurses.curs_set(0)
    ExNcurses.noecho()

    ExNcurses.listen()
    ExNcurses.start_color()
    ExNcurses.init_pair(1, :green, :black)
    ExNcurses.init_pair(2, :yellow, :black)
    ExNcurses.init_pair(3, :blue, :black)
    state = [field: :name]
    refresh(state)
    loop(state)
  end

  def loop(state) do
    receive do
      {:ex_ncurses, :key, @q} ->
        ExNcurses.n_end()
        exit(:shutdown)

      {:ex_ncurses, :key, key} ->
        new_state = State.update(state, key)

        if new_state != state do
          refresh(new_state)
        end

        loop(new_state)
    after
      5000 ->
        refresh(state)
        loop(state)
    end
  end

  defp refresh(state) do
    processes = Tree.puts()
    scheduler = Scheduler.read()
    lines = ExNcurses.lines()
    frame = Frame.new(processes, scheduler, state)

    ExNcurses.clear()
    ExNcurses.move(0, 0)

    print_blue(frame[:hr] <> "\n")
    print_blue("Welcome Spawnfest" <> "\n")
    print_blue(frame[:hr] <> "\n")

    print_green(frame[:header] <> "\n")
    print_yellow(frame[:hr] <> "\n")

    ExNcurses.addstr(frame[:columns] <> "\n")
    print_yellow(frame[:hr] <> "\n")

    ExNcurses.addstr(frame[:processes] <> "\n")
    print_yellow(frame[:hr] <> "\n")

    ExNcurses.refresh()
    ExNcurses.refresh()
    ExNcurses.refresh()
  end

  defp print_green(str) do
    ExNcurses.attron(1)
    ExNcurses.addstr(str)
    ExNcurses.attroff(1)
  end

  defp print_yellow(str) do
    ExNcurses.attron(2)
    ExNcurses.addstr(str)
    ExNcurses.attroff(2)
  end

  defp print_blue(str) do
    ExNcurses.attron(3)
    ExNcurses.addstr(str)
    ExNcurses.attroff(3)
  end
end
