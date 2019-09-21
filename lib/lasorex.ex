defmodule Lasorex do
  @moduledoc """
  Documentation for Lasorex.
  """
  alias Lasorex.{Scheduler, List, Format}

  def btop do
    Format.puts(List.list(), Scheduler.read())
  end
end
