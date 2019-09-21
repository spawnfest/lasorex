defmodule Lasorex.List do
  alias Lasorex.Process, as: Myprocess

  def list do
    Process.list() |> Enum.map(fn pid -> form_struct(Process.info(pid)) end)
  end

  def list(name) do
    list()
    |> Enum.filter(fn process -> process.name == name end)
  end

  defp form_struct(process_info) do
    %Myprocess{
      name: process_info[:registered_name],
      queue: process_info[:message_queue_len],
      memory: process_info[:total_heap_size]
    }
  end
end
