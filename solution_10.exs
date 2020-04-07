defmodule Solution08 do
  @moduledoc """
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """

  def solve(upper_limit) do
    upper_limit
    |> get_primes()
    |> sum_list()
  end

  defp sum_list(list), do: list |> Enum.reduce(2, &(&1 + &2))

  defp get_primes(upper_limit) do
    3..upper_limit
    |> Enum.filter(&(odd?(&1) && is_prime?(&1)))
  end

  defp odd?(integer), do: rem(integer, 2) != 0

  defp is_prime?(n) when n in [2, 3], do: true

  defp is_prime?(n) do
    floored = n |> square_root() |> floor_value()
    !Enum.any?(2..floored, &(rem(n, &1) == 0))
  end

  defp square_root(n), do: :math.sqrt(n)
  defp floor_value(n), do: Float.floor(n) |> round()
end

upper_limit = 2_000_000

{time, result} = :timer.tc(fn -> Solution08.solve(upper_limit) end)
IO.inspect(result)

# -> 142_913_828_922

IO.inspect("#{time / 1000} ms")
# -> 10840.023 ms
