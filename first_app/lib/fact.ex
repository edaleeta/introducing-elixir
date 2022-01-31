defmodule Fact do
  @moduledoc false

#  def factorial(n) when n > 1 do
#    IO.puts("Calling from #{n}")
#    result = n * factorial(n - 1)
#    IO.puts("#{n} yields #{result}")
#    result
#  end
#
#  def factorial(n) when n <= 1 do
#    IO.puts("Calling from #{n}")
#    IO.puts("#{n} yields 1")
#    1
#  end

# Tail recursive
  def factorial(n) do
    factorial(1, n, 1)
  end

  defp factorial(current, n, result) when current <= n do
    new_result = result * current
    IO.puts("#{current} yields #{new_result}")
    factorial(current + 1, n, new_result)
  end

  defp factorial(_current, _n, result) do
    IO.puts("finished")
    result
  end

end
