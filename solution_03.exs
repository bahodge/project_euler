defmodule Solution03 do

  @moduledoc """
    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143 ?
  """

  def solve(upper_limit), do: nth(upper_limit, 2)

  # if they are the same number, return the number
  def nth(n, n), do: n

  def nth(n, factor) do
      case rem(n, factor) do
        0 -> nth(div(n, factor), factor)
        _ -> nth(n, factor + 1)
      end
  end
end

{time, result} = :timer.tc(fn -> Solution03.solve(600851475143) end)
IO.puts(result)             # 6857
IO.puts("#{time / 1000} ms")  # 0.087 ms
