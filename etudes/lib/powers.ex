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

  @doc """
  Calculate the nth root of x using the Newton-Raphson method
  """

  @spec nth_root(number(), number()) :: number()

  def nth_root(x, n) do
    nth_root(x, n, x / 2.0)
  end

  def nth_root(x, n, a) do
    IO.puts("Current guess is #{a}")
    f = raise(a, n) - x
    f_prime = n * raise(a, n-1)
    next = a - f / f_prime
    change = abs(next - a)

    if change < 1.0e-8 do
      next
    else
      nth_root(x, n, next)
    end

  end

end
