defmodule Lasorex do
  @moduledoc """
  Documentation for Lasorex.
  """
  alias Lasorex.{Scheduler, State, Format, Tree}

  @q 113

  def btop do
    ExNcurses.initscr()
    # Hides cursor
    ExNcurses.curs_set(0)
    ExNcurses.noecho()
    ExNcurses.listen()
    state = [field: :queue, input: ""]
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
        refresh(new_state)
        loop(new_state)

    after
      500 ->
        refresh(state)
        loop(state)
    end
  end

  defp refresh(state) do
    ExNcurses.clear()
    processes = Tree.puts()
    scheduler = Scheduler.read()

    lines = ExNcurses.lines()

    frame = Format.to_string(processes, scheduler, lines)

    ExNcurses.mvprintw(0, 0, frame)
    ExNcurses.refresh()
  end
end
