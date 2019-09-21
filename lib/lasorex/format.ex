defmodule Lasorex.Format do
  @spec as_string(list(Lasorex.Process.t)) :: String.t
  def as_string(processes) do
    [header] ++ processes
    |> Enum.map(&to_string/1)
    |> Enum.join("\n")
    |> IO.puts
  end

  defp header, do: "#{usage}\n\nname\tqueue\tmemory"

  defp usage, do: "Usage: #{Float.round(Lasorex.Scheduler.read)}%"

  defimpl String.Chars, for: Lasorex.Process do
    def to_string(process) do
      "#{process.name}\t#{process.queue}\t#{process.memory}"
    end
  end
end
