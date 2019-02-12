defmodule PackageAppTest do
  use ExUnit.Case
  doctest PackageApp

  test "greets the world" do
    assert PackageApp.hello() == :world
  end
end
