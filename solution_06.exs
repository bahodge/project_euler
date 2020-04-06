defmodule Solution06 do
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
