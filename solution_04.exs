defmodule Solution04 do
  @moduledoc """
    A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

    Find the largest palindrome made from the product of two 3-digit numbers.
  """

  def solve(ceiling, floor), do: solve(ceiling, floor, [])
  # Final answer
  def solve(floor, floor, palindromes), do: Enum.max(palindromes) |> List.first()

  def solve(ceiling, floor, palindromes) do
    results = get_palindromes(ceiling, floor)

    solve(ceiling - 1, floor, [results | palindromes])
  end

  def get_palindromes(ceiling, floor) do
    multiply_range(ceiling, floor) |> filter_palindromes()
  end

  defp empty_list?([]), do: true
  defp empty_list?(_), do: false

  defp multiply_range(ceiling, floor) do
    ceiling..floor |> Enum.map(fn x -> ceiling * x end)
  end

  defp filter_palindromes(list), do: filter_palindromes(list, [])
  defp filter_palindromes([], acc), do: acc

  defp filter_palindromes([head | tail], acc) do
    case is_palindrome?(head) do
      true -> filter_palindromes(tail, [head | acc])
      _ -> filter_palindromes(tail, acc)
    end
  end

  def is_palindrome?(number) do
    split_int =
      Integer.to_string(number) |> String.split("") |> Enum.filter(fn char -> char != "" end)

    reversed_int = split_int |> reverse_list()
    reversed_int == split_int
  end

  defp reverse_list(list), do: reverse_list(list, [])
  defp reverse_list([], reversed_list), do: reversed_list
  defp reverse_list([head | tail], reversed_list), do: reverse_list(tail, [head | reversed_list])
end

ceiling = 999
floor = 100
{time, result} = :timer.tc(fn -> Solution04.solve(ceiling, floor) end)
# 906609
IO.inspect(result)
# 545.721 ms
IO.inspect("#{time / 1000} ms")
