defmodule Lasorex.List do
  alias Lasorex.Process, as: Myprocess

  def list do
    Process.list() |> Enum.map(fn pid -> form_struct(Process.info(pid), pid) end)
  end

  def list(process, :filter, name) do
    process
    |> Enum.sort(fn p1, p2 ->
      if String.bag_distance(String.downcase(name), String.downcase(p1.name)) >
           String.bag_distance(String.downcase(name), String.downcase(p2.name)) do
        true
      else
        false
      end
    end)
    |> Enum.take(5)
  end

  @doc """
  Sorting based on column
  Expected parameters are order of sorting and column name, both atoms
  Eg: (:sort_asc, :name) A-Z, 0-9
  Eg: (:sort_desc, :name) Z-A, 9-0
  """
  def list(process, :sort_asc, key) do
    process
    |> Enum.sort(fn x, y -> if Map.get(x, key) < Map.get(y, key), do: true, else: false end)
  end

  def list(process, :sort_desc, key) do
    process
    |> Enum.sort(fn x, y -> if Map.get(x, key) > Map.get(y, key), do: true, else: false end)
  end

  def list(process, :memory, :kb) do
    process
    |> Enum.map(fn p ->
      Map.put(p, :memory, p.memory / 1000)
    end)
  end

  defp form_struct(process_info, pid) do
    {:memory, memory} = Process.info(pid, :memory)

    %Myprocess{
      name: to_string(process_info[:registered_name]),
      queue: process_info[:message_queue_len],
      memory: memory,
      group_leader: process_info[:group_leader],
      pid: pid
    }
  end
end
