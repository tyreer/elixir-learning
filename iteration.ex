defmodule Iteration do
  # list_len/1: calculate the length of a list
  def list_len(list) do
    list_len(list, 0)
  end

  defp list_len([], current_sum), do: current_sum
  
  defp list_len([_ | tail], current_sum) do
    list_len(tail, current_sum + 1)
  end

  # range/2: takes two integers, from/to, and returns a list of all numbers in the given range

  def range(from, to) do
    build_list(from, to, [])
  end

  defp build_list(from, to, list) when from > to do
    Enum.reverse(list)
  end

  defp build_list(from, to, result) do
    build_list(from + 1, to, [from | result])
  end

  # positive/1: takes a list, returns another list that contains only the positive numbers from the input list

  def positive(list), do: build_positive(list, [])

  defp build_positive([], result), do: Enum.reverse(result)

  defp build_positive([head | tail], result) when head > 0 do
    build_positive(tail, [head | result])
  end

  defp build_positive([_ | tail], result) do
    build_positive(tail, result)
  end
end
