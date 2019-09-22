defmodule Lasorex.Format do
  @column_width 40

  def to_string(processes, usage, state) do
    [
      header(usage),
      columns(),
      hr(),
      processes_lines(processes, state)
    ]
    |> Enum.join("\n")
  end

  defp header(usage), do: "Scheduler Usage: #{usage}%"
  defp columns, do: Enum.join([name_column(), queue_column(), memory_column(), pid_column()], "")
  defp hr, do: String.duplicate("-", 150)

  defp name_column, do: String.pad_trailing("name", @column_width)
  defp queue_column, do: String.pad_trailing("queue", @column_width)
  defp memory_column, do: String.pad_trailing("memory", @column_width)
  defp pid_column, do: "pid"

  defp processes_lines(processes, state) do
    processes
    |> Lasorex.List.sort(state[:field])
    |> Enum.take(8)
    |> Enum.map(&to_string/1)
    |> Enum.map(&String.pad_trailing(&1, @column_width))
    |> Enum.join("\n")
  end
end
