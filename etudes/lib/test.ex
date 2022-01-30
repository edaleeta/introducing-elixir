defmodule Test do
  @moduledoc false

  def sum(a \\ 3, b, c \\ 7) do
    IO.puts(a)
    IO.puts(b) # In a case where sum is called with 1 arg, b has no default value and the value is assigned to that arg
    IO.puts(c)
    a + b + c
  end
end
