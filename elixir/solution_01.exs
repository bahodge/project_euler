defmodule Solution01 do
  @moduledoc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.

  """

  def solve(limit \\ 10) do
    # make a range
    0..(limit - 1)
    |> Enum.filter(fn x -> multiple_of_three(x) || multiple_of_five(x) end)
    |> Enum.sum()
  end

  defp multiple_of_three(x), do: rem(x, 3) == 0
  defp multiple_of_five(x), do: rem(x, 5) == 0
end

{time, result} = :timer.tc(fn -> Solution01.solve(1000) end)
# 233168
IO.puts(result)
# 0.428 ms
IO.puts("#{time / 1000} ms")
