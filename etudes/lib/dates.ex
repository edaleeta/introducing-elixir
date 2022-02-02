defmodule Dates do
  @moduledoc false

  @spec date_parts(date_string: String.t()) :: [integer(), ...]
  def date_parts(date_string) do
    String.split(date_string, "-")
      |>Enum.map(fn part -> String.to_integer(part) end)
  end

end
