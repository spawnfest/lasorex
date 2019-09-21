defmodule Lasorex do
  @moduledoc """
  Documentation for Lasorex.
  """
  alias Lasorex.{Scheduler, List, Format, Tree}

  def btop do
    ExNcurses.n_begin()
    ExNcurses.curs_set(0)
    ExNcurses.clear()
    ExNcurses.refresh()
    ExNcurses.mvprintw(0, 0, Format.to_string(Tree.puts(), Scheduler.read()))
    ExNcurses.refresh()
    ExNcurses.listen()
    loop()
  end

  defp loop() do
    receive do
      {:ex_ncurses, :key, key} ->
        ExNcurses.mvprintw(20, 0, "You just typed #{key}")
        loop()
    end
  end
end
