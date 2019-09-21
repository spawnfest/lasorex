defmodule Lasorex.Format do
  def header, do: "name\tqueue\tmemory"

  defimpl String.Chars, for: Lasorex.Process do
    def to_string(process) do
      IO.puts("{#process.name}\t#{process.queue}\t#{process.memory}")
    end
  end
end
