defmodule MyList do
  def mapsum(list, func), do: _mapsum(list, func, 0)

  defp _mapsum([], _func, value), do: value
  defp _mapsum([head | tail], func, value), do: _mapsum(tail, func, value + func.(head))

  # max(list)
  def max([head | tail]), do: _max(tail, head)

  defp _max([], max), do: max
  defp _max([head | tail], max) when head < max, do: _max(tail, max)
  defp _max([head | tail], max) when max < head, do: _max(tail, head)

  # ceasar(list, n)
  def ceasar([], _n), do: []
  def ceasar([head | tail], n) when 122 < head+n, do: [head+n-26, ceasar(tail, n)]
  def ceasar([head | tail], n), do: [head+n, ceasar(tail, n)]
end

IO.puts MyList.mapsum([1, 2, 3], &(&1 * &1))
IO.puts MyList.max([1, 5, 7, 2, 4])
IO.puts MyList.ceasar('ryvkve', 13)
