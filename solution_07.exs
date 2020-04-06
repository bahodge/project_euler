defmodule Solution07 do
  @moduledoc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

  What is the 10 001st prime number?
  """

  def solve(index) do
    Stream.iterate(2, &(&1 + 1 ))
    |> Enum.reduce_while([], fn (i, acc) ->
      if Enum.count(acc) > index - 1 do
        {:halt,acc}
      else
        {:cont, prepend_prime(i, acc)}
      end
    end)
    |> List.first()
  end

  # Adds to beginning of acc
  defp prepend_prime(n, acc) do
    if is_prime?(n), do:  [ n | acc ], else: acc
  end

  ### Fermat's Algorithm

  # 2 and 3 are prime
  defp is_prime?(n) when n in [2, 3], do: true

  defp is_prime?(n) do
    floored = n |> square_root() |> floor_value()

    # See if anything evenly divides between 2 and the square root of n
    !Enum.any?(2..floored, &(rem(n, &1) == 0))
  end

  defp square_root(n), do: :math.sqrt(n)
  defp floor_value(n), do: Float.floor(n) |> round()
end

index = 10_001

{time, result} = :timer.tc(fn -> Solution07.solve(index) end)
IO.inspect(result)
# -> 104_743

IO.inspect("#{time / 1000} ms")
# -> 897.93 ms
