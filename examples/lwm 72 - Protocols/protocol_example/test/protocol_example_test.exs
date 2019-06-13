defmodule ProtocolExampleTest do
  use ExUnit.Case
  doctest ProtocolExample

  test "greets the world" do
    assert ProtocolExample.hello() == :world
  end
end
