defmodule Powers do
  import Kernel, except: [raise: 2]

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
    x * raise(x, n-1)
  end

  def raise(x, n) when n < 0 do
    1.0 / raise(x, -n)
  end

end
