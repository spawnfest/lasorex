defmodule Lasorex.Process do
  @column_width 50
  defstruct [:name, :queue, :memory]

  defimpl String.Chars, for: __MODULE__ do
    def to_string(process) do
      [process.name, process.queue, process.memory]
      |> Enum.map(&"#{&1}")
      |> Enum.map(&String.pad_trailing(&1, 50))
      |> Enum.join("")
    end
  end
end
