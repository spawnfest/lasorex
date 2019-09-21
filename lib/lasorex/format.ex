defmodule Lasorex.Format do
  @column_width 50

  @spec puts(list(Lasorex.Process.t()), Float.t()) :: String.t()
  def puts(processes, usage) do
    ([header(usage)] ++ [columns()] ++ processes)
    |> Enum.map(&to_string/1)
    |> Enum.join("\n")
    |> IO.puts()
  end

  defp header(usage), do: "Usage: #{usage}%"
  defp columns, do: Enum.join([name_column(), queue_column(), memory_column()], "")

  defp name_column, do: String.pad_trailing("name", @column_width)
  defp queue_column, do: String.pad_trailing("queue", @column_width)
  defp memory_column, do: "memory"
end
