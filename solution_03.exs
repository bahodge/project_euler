defmodule Solution03 do
  @moduledoc """
    The prime factors of 13195 are 5, 7, 13 and 29.

    What is the largest prime factor of the number 600851475143 ?
  """

  def solve(upper_limit), do: nth(upper_limit, 2)

  # if they are the same number, return the number
  def nth(n, n), do: n

  def nth(n, factor) do
    # Get remainder of n % factor
    # IO.inspect("(#{n}, #{factor}) -> rem: #{rem(n, factor)} == 0 -> #{rem(n, factor) == 0}")

    case rem(n, factor) do
      # If 0 it is not prime
      # Divide n by factor
      # Call again
      0 -> nth(div(n, factor), factor)
      # If anything else
      # N is prime this iteration
      # # Call again until n == factor
      # This means it is prime
      # if that is the case se above:14
      _ -> nth(n, factor + 1)
    end
  end
end

{time, result} = :timer.tc(fn -> Solution03.solve(600_851_475_143) end)
# 6857
IO.puts(result)
# 0.087 ms
IO.puts("#{time / 1000} ms")
