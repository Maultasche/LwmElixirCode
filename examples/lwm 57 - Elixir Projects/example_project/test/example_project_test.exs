defmodule ExampleProjectTest do
  use ExUnit.Case
  doctest ExampleProject

  test "greets the world" do
    assert ExampleProject.hello() == :world
  end
end
