defmodule Chop do
  def guess(actual, a..b) do
    guess(actual, a..b, div(b-a+1, 2))
  end

  def guess(actual, _, actual) do
    IO.puts "Is it #{actual}"
    IO.puts "#{actual}"
  end

  def guess(actual, _..b, value) when value < actual do
    IO.puts "Is it #{value}"
    guess(actual, value+1..b, value+div(b-value+1, 2))
  end

  def guess(actual, a.._, value) when actual < value do
    IO.puts "Is it #{value}"
    guess(actual, a..value-1, a+div(value-1-a, 2))
  end
end

Chop.guess(273, 1..1000)
