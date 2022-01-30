defmodule Geom do
  @moduledoc """
  Includes geometric calculations
  """

  @doc """
  Calculates the area of a rectangle with a given length and width
  The default value for both arguments is 1
  """
  @spec area(number(), number()) :: number()
  def area(length \\ 1, width \\ 1) when length > 0 and width > 0 do
    length * width
  end

end
