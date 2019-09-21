defmodule Lasorex.Scheduler do
  def read, do: Tachometer.read() |> Float.round(2)
end
