defmodule Quicksort do
  def sort([h | t]) do
    # Enum.filterで要素を取り出す
    greater = Enum.filter(t, fn (x) -> x > h end)

    # こういう書き方もできる. 関数を渡す&パイプライン
    smaller? = &(&1<h)
    smaller = t |> Enum.filter(smaller?)

    sort(smaller) ++ [h] ++ sort(greater)
  end

  def sort([]) do
    []
  end
end

ary = Enum.shuffle(1..20)
sorted = Quicksort.sort(ary)

IO.inspect ary
IO.inspect sorted
