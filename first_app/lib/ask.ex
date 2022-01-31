defmodule Ask do
  @moduledoc false



  def line() do
    planemo = get_planemo()
    distance = get_distance()
    Drop.fall_velocity({planemo, distance})
  end

  def get_planemo() do
    IO.puts("""
      Which planemo are you on?
      1. Earth
      2. Moon
      3. Mars
    """)

    IO.gets("Which > ")
    |> String.first()
    |> char_to_planemo()
  end

  def get_distance() do
    IO.gets("How far (meters) > ")
    |>String.trim()
    |> String.to_integer()
  end

  def char_to_planemo("1"), do: :earth
  def char_to_planemo("2"), do: :moon
  def char_to_planemo("3"), do: :mars

end
