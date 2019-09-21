defmodule Lasorex.List do
  alias Lasorex.Process, as: Myprocess

  def list do
    Process.list() |> Enum.map(fn pid -> form_struct(Process.info(pid)) end)
  end

  def list(:filter, name) do
    list()
    |> Enum.filter(fn process ->
      String.contains?(String.downcase(process.name), String.downcase(name))
    end)
  end

  @doc """
  Sorting based on column
  Expected parameters are order of sorting and column name, both atoms
  Eg: (:sort_asc, :name) A-Z, 0-9
  Eg: (:sort_desc, :name) Z-A, 9-0
  """
  def list(:sort_asc, key) do
    list()
    |> Enum.sort(fn x, y -> if Map.get(x, key) < Map.get(y, key), do: true, else: false end)
  end

  def list(:sort_desc, key) do
    list()
    |> Enum.sort(fn x, y -> if Map.get(x, key) > Map.get(y, key), do: true, else: false end)
  end

  defp form_struct(process_info) do
    %Myprocess{
      name: to_string(process_info[:registered_name]),
      queue: process_info[:message_queue_len],
      memory: process_info[:total_heap_size]
    }
  end
end
