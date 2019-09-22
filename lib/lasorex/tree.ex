defmodule Lasorex.Tree do
  alias Lasorex.List

  def puts, do: puts(:no_action, :no_comand)

  def puts(action, comand) do
    process =
      case action do
        :no_action -> List.list()
        #  TODO: change List.list() for the process in the current state
        _ -> List.list() |> List.list(action, comand)
      end

    process
    |> get_groups()
    |> update_members(process)
  end

  defp get_groups(process) do
    process
    |> Enum.reduce(Map.new(), fn p, acc ->
      Map.merge(acc, %{"#{inspect(p.group_leader)}" => [p]}, fn _k, v1, v2 ->
        v1 ++ v2
      end)
    end)
  end

  defp update_members(groups, process) do
    process
    |> Enum.map(fn p ->
      Map.get(groups, "#{inspect(p.pid)}")
      |> case do
        nil -> p
        members -> Map.put(p, :members, members)
      end
    end)
  end
end
