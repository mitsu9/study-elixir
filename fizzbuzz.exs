fb = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n -> n
end

fb_n = fn
  n -> fb.(rem(n, 3), rem(n, 5), n)
end

IO.puts fb_n.(10)
IO.puts fb_n.(11)
IO.puts fb_n.(12)
IO.puts fb_n.(13)
IO.puts fb_n.(14)
IO.puts fb_n.(15)
IO.puts fb_n.(16)
