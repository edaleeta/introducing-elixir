defmodule Geom do
  @moduledoc false

  def area(length \\ 1, width \\ 1) when length > 0 and width > 0 do
    length * width
  end

end
