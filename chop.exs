defmodule Chop do
  def guess(actual, range, value \\ 500)

  def guess(actual, _, actual) do
    IO.puts "Is it #{actual}"
    IO.puts "#{actual}"
  end

  def guess(actual, range, value) when value < actual do
    IO.puts "Is it #{value}"
    _..b = range
    guess(actual, value+1..b, value+div(b-value+1, 2))
  end

  def guess(actual, range, value) when actual < value do
    IO.puts "Is it #{value}"
    a.._ = range
    guess(actual, a..value-1, a+div(value-1-a, 2))
  end
end

Chop.guess(273, 1..1000)
