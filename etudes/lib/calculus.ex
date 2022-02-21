defmodule Calculus do
  @moduledoc """
  Includes calculus functions
  """

  @doc """
  Finds the derivative of a funciton at point x.
  """

  @spec derivative(fun, number) :: number

  def derivative(func, x) do
    delta = 1.0e-10
    (func.(x + delta) - func.(x)) / delta
  end

end
