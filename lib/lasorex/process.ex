defmodule Lasorex.Process do

  defstruct [:name, :queue, :memory]

  defimpl String.Chars, for: __MODULE__ do
    @column_width 50
    def to_string(process) do
      [process.name, process.queue, process.memory]
      |> Enum.map(&"#{&1}")
      |> Enum.map(&String.pad_trailing(&1, @column_width))
      |> Enum.join("")
    end
  end
end
