defmodule DepProjectTest do
  use ExUnit.Case
  doctest DepProject

  test "greets the world" do
    assert DepProject.hello() == :world
  end
end
