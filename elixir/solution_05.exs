defmodule Solution05 do
  @moduledoc """
    2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

    What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  """

  def solve(floor, ceiling) do
    list = Enum.to_list(floor..ceiling)
    range_list_length = Enum.count(list)

    attempt(list, range_list_length)
  end

  defp attempt(list, range_list_length) do
    list
    |> get_common_multiples()
    |> group_values()
    |> reduce_results(range_list_length)
    |> final_evaluation(range_list_length)
  end

  defp reduce_results(group_map, range_list_length) do
    keys = Map.keys(group_map)
    results = Enum.filter(keys, fn key -> group_map[key] >= range_list_length end)

    case Enum.count(results) == 0 do
      true -> attempt(keys, range_list_length)
      _ -> results
    end
  end

  defp final_evaluation(list, range_list_length) when is_list(list) do
    case Enum.count(list) == 1 do
      false -> attempt(list, range_list_length)
      # FINAL RESULT!
      _ -> List.first(list)
    end
  end

  defp final_evaluation(result, _range_list_length), do: result

  defp group_values(lists), do: group_values(lists, %{})
  defp group_values([], group_map), do: group_map

  defp group_values([list | tail], group_map) do
    new_group_map =
      Enum.reduce(list, group_map, fn num, acc ->
        case Map.has_key?(acc, num) do
          true -> Map.put(acc, num, acc[num] + 1)
          _ -> Map.put(acc, num, 1)
        end
      end)

    group_values(tail, new_group_map)
  end

  defp get_common_multiples(list) do
    list |> Enum.map(fn num -> get_all_lcm(num, list) |> Enum.uniq() end)
  end

  defp get_all_lcm(num, list), do: get_all_lcm(num, list, [])
  defp get_all_lcm(_num, [], acc), do: acc

  defp get_all_lcm(num, [head | tail], acc) do
    get_all_lcm(num, tail, [lcm(num, head) | acc])
  end

  defp lcm(a, b), do: div(a * b, gcd(a, b))

  defp gcd(0, b), do: b
  defp gcd(a, b), do: gcd(rem(b, a), a)
end

floor = 1
ceiling = 20

{time, result} = :timer.tc(fn -> Solution05.solve(floor, ceiling) end)
IO.inspect(result)
# -> 232_792_560

# -> 5.919 ms
IO.inspect("#{time / 1000} ms")
