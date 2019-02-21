defmodule MathModuleTest do
  use ExUnit.Case, async: true
	doctest MathModule

  import MathModule, only: [add: 2, subtract: 2]

  describe "Testing the add function" do
	  test "Add two positive numbers" do
		  assert add(102, 45) == 147
	  end

	  test "Add a positive and a negative number" do
		  assert add(4, -4) == 0
	  end

	  test "Add two negative numbers" do
		  assert add(-6, -8) == -14
	  end
  end

  describe "Testing the subtract function" do
	  test "Subtract two positive numbers to get a positive result" do
		  assert subtract(20, 18) == 2
	  end

	  test "Subtract two positive numbers to get a zero result" do
		  assert subtract(31, 31) == 0
	  end

	  test "Subtract two positive numbers to get a negative result" do
		  assert subtract(14, 21) == -7
	  end

	  test "Subtract a negative from a positive number" do
		  assert subtract(4, -4) == 8
	  end

	  test "Subtract a positive from a negative number" do
		  assert subtract(-6, 8) == -14
	  end

	  test "Subtract two negative numbers" do
		  assert subtract(-6, -8) == 2
	  end

	  test "Subtract a zero from a positive number" do
		  assert subtract(6, 0) == 6
	  end

	  test "Subtract a zero from a negative number" do
		  assert subtract(-3, 0) == -3
	  end

	  test "Subtract a zero from a zero" do
		  assert subtract(0, 0) == 0
	  end
  end
end
