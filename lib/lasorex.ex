defmodule Lasorex do
  @moduledoc """
  Documentation for Lasorex.
  """
  alias Lasorex.{Scheduler, List, Format, Tree}

  def btop do
    ExNcurses.n_begin()
    # Hides cursor
    ExNcurses.curs_set(0)
    ExNcurses.listen()
    loop(field: :queue)
  end

  def loop(state) do
    receive do
      {:ex_ncurses, :key, key} ->

        ExNcurses.clear()
        ExNcurses.mvprintw(0, 0, to_string(key))
        ExNcurses.refresh()

        loop(state)
    after
      1000 ->
        frame = Format.to_string(Tree.puts(), Scheduler.read(), ExNcurses.lines())

        ExNcurses.mvprintw(0, 0, frame)
        ExNcurses.refresh()

        loop(state)
    end
  end
end
