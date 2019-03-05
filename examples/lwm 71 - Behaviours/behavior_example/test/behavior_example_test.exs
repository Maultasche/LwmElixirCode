defmodule BehaviorExampleTest do
  use ExUnit.Case
  doctest BehaviorExample

  test "greets the world" do
    assert BehaviorExample.hello() == :world
  end
end
