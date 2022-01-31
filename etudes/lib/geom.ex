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
  defp area(shape, a, b) when a > 0 and b > 0 do
    case shape do
      :rectangle -> a * b
      :triangle -> a * b / 2.0
      :ellipse -> :math.pi() * a * b
      _ -> 0
    end
  end

end
