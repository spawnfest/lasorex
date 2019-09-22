defmodule Lasorex.Process do
  defstruct [:name, :queue, :memory, :pid, :group_leader, members: []]

  defimpl String.Chars, for: __MODULE__ do
    @column_width 40
    def to_string(process) do
      proc =
        [
          "#{format_pname(process.name)}",
          "#{process.queue}",
          "#{process.memory}",
          "#{inspect(process.pid)}"
        ]
        |> parser

      case process.members do
        [] ->
          proc

        _ ->
          proc <> "\n" <> get_members(process.members)
      end
    end

    defp get_members(members) do
      members
      |> Enum.map(fn p ->
        ["   |___ #{format_pname(p.name)}", "#{p.queue}", "#{p.memory}", "#{inspect(p.pid)}"]
        |> parser
      end)
      |> Enum.join("\n")
    end

    def format_pname(val) do
      if val == "" do
        "<no_name>"
      else
        val
      end
    end

    defp parser(list) do
      list
      |> Enum.map(&String.pad_trailing(&1, @column_width))
      |> Enum.join("")
    end
  end
end
