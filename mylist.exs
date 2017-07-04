defmodule MyList do
  def mapsum(list, func), do: _mapsum(list, func, 0)

  defp _mapsum([], _func, value), do: value
  defp _mapsum([head | tail], func, value), do: _mapsum(tail, func, value + func.(head))
end

IO.puts MyList.mapsum([1, 2, 3], &(&1 * &1))
