defmodule Lasorex.Process do
  defstruct [:name, :queue, :memory]

  """
  %Process{name: "alan", queue: 2, memory: 3, members: [%Process{name: veer}]}
  alan          2        3
    |____ veer  3        6
  """
  defimpl String.Chars, for: __MODULE__ do
    @column_width 40
    def to_string(process) do
      [process.name, process.queue, process.memory]
      |> Enum.map(&"#{&1}")
      |> Enum.map(&String.pad_trailing(&1, @column_width))
      |> Enum.join("")
    end
  end
end
