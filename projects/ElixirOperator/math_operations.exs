defmodule MathOperations do
	@pi 3.141592653589793
	
	def add(x, y), do: x + y
	def subtract(x, y), do: x - y
	def multiply(x, y), do: x * y
	def divide(x, y), do: x / y
	def mod(x, y), do: rem(x, y)
	def negate(x), do: -x
	def square(x), do: x * x
	def pi(), do: @pi
end