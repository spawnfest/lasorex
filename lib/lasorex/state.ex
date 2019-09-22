defmodule Lasorex.State do
  @m 109
  @q 113
  @n 110

  def update(state, key) do
    case key do
      @m ->
        state ++ [field: :memory]

      @q ->
        state ++ [field: :exit]

      @n ->
        state ++ [field: :name]
    end
  end
end
