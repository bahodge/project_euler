defmodule Solution08 do
  @moduledoc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

  a2 + b2 = c2
  For example, 32 + 42 = 9 + 16 = 25 = 52.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.
  """

  def solve(target, _, target), do: "No Solution"
  def solve(a, target, target), do: solve(a + 1, a + 2, target)

  def solve(a, b, target) do
    c =
      [a, b]
      |> Enum.map(&square/1)
      |> sum_list()
      |> square_root()

    [a, b, c]
    |> sum_list()
    |> matches?(target)
    |> if do
      multiply_list([a, b, c])
      |> Float.floor()
      |> round()
    else
      solve(a, b + 1, target)
    end
  end

  defp matches?(val, target), do: val == target
  defp square_root(n), do: :math.sqrt(n)
  defp square(n), do: n * n
  defp sum_list(list), do: Enum.reduce(list, 0, &(&1 + &2))
  defp multiply_list(list), do: Enum.reduce(list, 1, &(&1 * &2))
end

a = 3
b = 4
target = 1_000

{time, result} = :timer.tc(fn -> Solution08.solve(a, b, target) end)
IO.inspect(result)

# -> 31_875_000

IO.inspect("#{time / 1000} ms")
# -> 38.984 ms
