defmodule Geom do
  @moduledoc """
  Includes geometric calculations
  """

  @type shape :: :ellipse | :rectangle | :triangle

  @doc """
  Calculates the area of an ellipse, rectangle, or triangle
  """
  @spec area({shape, number(), number()}) :: number()
  def area({shape, a, b}) do
    area(shape, a, b)
  end

  @spec area(:rectangle, number(), number()) :: number()
  defp area(:rectangle, length, width) when length > 0 and width > 0 do
    length * width
  end

  @spec area(:triangle, number(), number()) :: number()
  defp area(:triangle, base, height) when base > 0 and height > 0 do
    base * height / 2.0
  end

  @spec area(:ellipse, number(), number()) :: number()
  defp area(:ellipse, major_radius, minor_radius) when major_radius > 0 and minor_radius > 0 do
    :math.pi() * major_radius * minor_radius
  end


end
