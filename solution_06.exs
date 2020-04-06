defmodule Solution06 do
  @moduledoc """
  The sum of the squares of the first ten natural numbers is,

  12+22+...+102=385
  The square of the sum of the first ten natural numbers is,

  (1+2+...+10)2=552=3025
  Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025−385=2640.

  Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
  """

  def solve(list) do
    square_sum = sum_list(list) |> square()
    square_sum - square_list(list)
  end

  defp square(num), do: num * num
  defp sum_list(list), do: Enum.reduce(list, 0, fn num, acc -> num + acc end)
  defp square_list(list), do: Enum.reduce(list, 0, fn num, acc -> square(num) + acc end)
end

list = 0..100 |> Enum.to_list()

{time, result} = :timer.tc(fn -> Solution06.solve(list) end)
IO.inspect(result)
# -> 25_164_150

# -> 0.003 ms
IO.inspect("#{time / 1000} ms")
