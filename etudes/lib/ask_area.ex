defmodule AskArea do
  @moduledoc false

  @type shape :: Geom.shape | :unknown

  def area() do
    input = IO.gets("R)ectangle, T)riangle, or E)llipse: ")
    shape = String.first(input)
      |> String.downcase()
      |> char_to_shape()

    {a, b} = case shape do
      :ellipse -> get_dimensions("major_radius", "minor_radius")
      :rectangle -> get_dimensions("width", "height")
      :triangle -> get_dimensions("base", "height")
      _ -> {String.first(input), 0}
    end

    calculate(shape, a, b)
  end

  @spec calculate(shape, number() | String.t(), number()) :: number() | :ok
  def calculate(:unknown, a, _b) do
    IO.puts("Unknown shape #{a}")
  end

  def calculate(_shape, a, b) when not is_number(a) or not is_number(b) do
    IO.puts("Non-number dimensions received. a: #{a}, b: #{b}")
  end

  def calculate(_shape, a, b) when a < 0 or b < 0 do
    IO.puts("Both numbers must be greater than or equal to 0. Received a: #{a}, b: #{b}")
  end

  def calculate(shape, a, b) do
    Geom.area({shape, a, b})
  end

  @spec get_number(String.t()) :: integer()
  def get_number(message) do
    IO.gets("Enter #{message} > ")
    |> String.trim()
    |> String.to_integer()
  end
  
  @spec get_dimensions(String.t(), String.t()) :: {number(), number()}
  def get_dimensions(prompt_a, prompt_b) do
    {get_number(prompt_a), get_number(prompt_b)}
  end

  @spec char_to_shape(String.t()) :: shape
  def char_to_shape("e"), do: :ellipse
  def char_to_shape("r"), do: :rectangle
  def char_to_shape("t"), do: :triangle
  def char_to_shape(_), do: :unknown

end
