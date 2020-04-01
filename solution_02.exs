defmodule Solution02 do


def fib_even_sum do
  fib() # Get fib
  |> Stream.take_while(&(&1 < 4_000_000)) # Take all values under 4 million
  |> Enum.reduce(0, &sum_even/2) # Sum all the even values into one value
end

# Produces an infinite stream of fibonacci
def fib() do
  # next_acc, next_func
  # Start at a = 1 and b = 1
  # take a
  # set b = a + b
  # Set a = b
  # first iteration should be [ 1, 1 + 1 ] => [ 1, 2 ]
  Stream.unfold({ 1, 1 }, fn { a, b } -> { a, { b, a + b } } end)
end

# If even, adds, if not returns the accumulator
def sum_even(num, acc) do
  if rem(num, 2) == 0, do: acc + num, else: acc
end

end

Solution02.fib_even_sum()
|> IO.inspect


