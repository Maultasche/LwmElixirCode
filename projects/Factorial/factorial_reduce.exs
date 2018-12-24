#Factorial implementation using a range and reduce
defmodule Factorial do
	def of(0), do: 1
	def of(n) when n > 0 do
		Enum.reduce(1..n, fn (x, fact) -> fact * x end)
	end
end