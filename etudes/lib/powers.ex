defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  @moduledoc false

  @doc """
  Raises x to the nth power
  """

  @spec raise(number(), number()) :: number()

  def raise(_x, n) when n == 0 do
    1
  end

  def raise(x, n) when n == 1 do
    x
  end

  def raise(x, n) when n > 0 do
    raise(x, n, 1)
  end

  def raise(x, n) when n < 0 do
    1.0 / raise(x, -n)
  end

  def raise(_x, n, accumulator) when n == 0 do
    accumulator
  end

  def raise(x, n, accumulator) do
    raise(x, n-1, x * accumulator)
  end

end
