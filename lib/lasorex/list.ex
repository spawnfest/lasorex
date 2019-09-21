defmodule Lasorex.List do
  alias Lasorex.Process, as: Myprocess

  def list do
    Process.list() |> Enum.map(fn pid -> form_struct(Process.info(pid)) end)
  end

  def form_struct(process_info) do
    %Myprocess{
      name: process_info[:registered_name],
      queue: process_info[:message_queue_len],
      memory: process_info[:heap_size]
    }
  end
end
