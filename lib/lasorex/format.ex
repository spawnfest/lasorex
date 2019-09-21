defmodule Lasorex.Format do
  @column_width 40

  import IO.ANSI

  @spec to_string(list(Lasorex.Process.t()), Float.t()) :: String.t()
  def to_string(processes, usage) do
    [
      header(usage),
      columns(),
      hr(),
      processes_lines(processes)
    ]
    |> Enum.join("\n")
  end

  defp header(usage), do: "Scheduler Usage: #{usage}%"
  defp columns, do: Enum.join([name_column(), queue_column(), memory_column(), pid_column()], "")
  defp hr, do: String.duplicate("-", 150)

  defp name_column, do: String.pad_trailing("name", @column_width)
  defp queue_column, do: String.pad_trailing("queue", @column_width)
  defp memory_column, do: String.pad_trailing("memmory", @column_width)
  defp pid_column, do: "pid"

  defp processes_lines(processes) do
    processes
    |> Enum.take(10)
    |> Enum.map(&to_string/1)
    |> Enum.map(&String.pad_trailing(&1, @column_width))
    |> Enum.join("\n")
  end
end
