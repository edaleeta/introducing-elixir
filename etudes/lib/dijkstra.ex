defmodule Dijkstra do
  @moduledoc false

  @doc """
  Calculates the greatest common divisor of two integers.
  Uses Dijkstra's algorithm, which does not require any division.
  """
  @spec gcd(integer(), integer()) :: integer()
  def gcd(m, n)  when m == n do
    m
  end

  def gcd(m, n) when m > n do
    gcd(m-n, n)
  end

  def gcd(m, n) do
    gcd(m, n-m)
  end

end
