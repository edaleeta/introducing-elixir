defmodule Drop do
  @moduledoc """
  Functions calculating velocities achieved by objects dropped in a vacuum.
  """
  import :math, only: [sqrt: 1]

  def fall_velocity({planemo, distance}) do
    fall_velocity(planemo, distance)
  end

  def fall_velocity(planemo, distance) when distance >= 0 do
    gravity = case planemo do
      :earth -> 9.8
      :moon -> 1.6
      :mars -> 3.71
    end
    velocity = sqrt(2 * gravity * distance)

    if velocity > 20 do
      IO.puts("Look out below!")
    else
      IO.puts("Reasonable...")
    end

#    cond do
#      velocity == 0 -> :stable
#      velocity < 5 -> :slow
#      velocity >= 5 and velocity < 10 -> :moving
#      velocity >= 10 and velocity < 20 -> :fast
#      velocity >= 20 -> :speedy
#    end
    velocity
  end

end