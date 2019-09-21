defmodule Lasorex.Format do
  @column_width 40

  import IO.ANSI

  @spec puts(list(Lasorex.Process.t()), Float.t()) :: String.t()
  def puts(processes, usage) do
    [
      clear(),
      cursor(0, 0),
      header(usage),
      columns(),
      hr(),
      processes_lines(processes)
    ]
    |> Enum.join("\n")
    |> IO.puts()
  end

  defp header(usage), do: "Scheduler Usage: " <> color_usage(usage) <> "#{usage}%\n" <> reset()
  defp columns, do: Enum.join([name_column(), queue_column(), memory_column()], "")
  defp hr, do: yellow() <> String.duplicate("-", 90) <> reset()

  defp name_column, do: String.pad_trailing("name", @column_width)
  defp queue_column, do: String.pad_trailing("queue", @column_width)
  defp memory_column, do: "memory"

  def color_usage(usage) when usage > 50.0, do: red()
  def color_usage(_), do: green()


  defp processes_lines(processes) do
    processes
    |> Enum.take(10)
    |> Enum.map(&to_string/1)
    |> Enum.map(&String.pad_trailing(&1, @column_width))
    |> Enum.join("\n")
  end
end
