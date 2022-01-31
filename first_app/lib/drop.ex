defmodule Drop do
  @moduledoc """
  Functions calculating velocities achieved by objects dropped in a vacuum.
  """
  import :math, only: [sqrt: 1]

  def fall_velocity(where) do
    {planemo, distance} = where
    fall_velocity(planemo, distance)
  end

  defp fall_velocity(:earth, distance) when distance >= 0 do
    sqrt(2 * 9.8 * distance)
  end

  defp fall_velocity(:moon, distance) when distance >= 0 do
    sqrt(2 * 1.6 * distance)
  end

  defp fall_velocity(:mars, distance) when distance >= 0 do
    sqrt(2 * 3.71 * distance)
  end
end

