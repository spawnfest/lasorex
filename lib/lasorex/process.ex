defmodule Lasorex.Process do
  defstruct [:name, :queue, :memory, :pid, :group_leader, members: []]

  defimpl String.Chars, for: __MODULE__ do
    @column_width 40
    def to_string(process) do
      members = get_members_name(process.members)

      proc =
        ["#{process.name}", "#{process.queue}", "#{process.memory}"]
        |> parser

      proc <> "\n" <> members
    end

    defp get_members_name(members) do
      members
      |> Enum.map(fn p ->
        ["   |___ #{p.name}", "#{p.queue}", "#{p.memory}"]
        |> parser
      end)
      |> Enum.join("\n")
    end

    defp parser(list) do
      list
      |> Enum.map(&String.pad_trailing(&1, @column_width))
      |> Enum.join("")
    end
  end
end
