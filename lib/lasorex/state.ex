defmodule Lasorex.State do
  @m 109
  @q 113
  @n 110
  @b 98

  def update([field: :memory], @n), do: [field: :name]
  def update([field: :queue], @n), do: [field: :name]

  def update([field: :name], @m), do: [field: :memory]
  def update([field: :queue], @m), do: [field: :memory]

  def update([field: :name], @b), do: [field: :queue]
  def update([field: :memory], @b), do: [field: :queue]
  def update(state, _key), do: state
end
