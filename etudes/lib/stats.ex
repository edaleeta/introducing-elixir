defmodule Stats do
  @moduledoc """
  Includes statistical calculations
  """

  @doc """
  Given a list of numbers, returns the smallest number
  """

  @spec minimum([number]) :: number

  def minimum(numbers) do
    [h | t] = numbers
    minimum(h, t)
  end

  @spec minimum(number, [number]) :: number

  defp minimum(current_smallest, []) do
    current_smallest
  end

  defp minimum(current_smallest, numbers) do
    [h | t] = numbers
    if h < current_smallest do
      minimum(h, t)
    else
      minimum(current_smallest, t)
    end
  end

  @doc """
  Given a list of numbers, returns the largest number
  """

  @spec maximum([number]) :: number

  def maximum(numbers) do
    [h | t] = numbers
    maximum(h, t)
  end

  @spec maximum(number, [number]) :: number

  defp maximum(current_largest, []) do
    current_largest
  end

  defp maximum(current_largest, numbers) do
    [h | t] = numbers
    if h > current_largest do
      maximum(h, t)
    else
      maximum(current_largest, t)
    end
  end

  @doc """
  Given a list of numbers, returns the smallest and largest values in a list
  """

  @spec range([number]) :: [number]

  def range(numbers) do
    [minimum(numbers), maximum(numbers)]
  end

  @doc """
  Calculate the mean of a list of numbers
  """

  @spec mean([number]) :: number

  def mean(numbers) do
    List.foldl(numbers, 0, fn(x, acc) -> x + acc end) / length(numbers)
  end

  @doc """
  Calculate the standard deviation of a list of numbers
  """

  @spec stdv([number]) :: number

  def stdv(numbers) do
    n = length(numbers)
    {sum, sum_of_squares} = List.foldl(numbers, {0, 0},
      fn(x, {acc_sum, acc_sum_of_squares}) -> {x + acc_sum, x * x + acc_sum_of_squares} end)

    :math.sqrt(((n * sum_of_squares) - (sum * sum)) / (n * (n - 1)))
  end

end
