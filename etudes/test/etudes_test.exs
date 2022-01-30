defmodule EtudesTest do
  use ExUnit.Case
  doctest Etudes

  test "greets the world" do
    assert Etudes.hello() == :world
  end
end
