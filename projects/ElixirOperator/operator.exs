defmodule Operator do
	#Takes some data and a function with one parameter and applies a function to that data
	def apply(operation, data) do
		operation.(data)
	end

	#Takes some data and a function with two parameters and applies a function to that data
	def apply(operation, data1, data2) do
		operation.(data1, data2)
	end
	
	#Takes some data and two functions, the first function with one parameter and the second function with 
	#one parameter and applies the first function to that data, with the second function fed the result
	#of the first function. The result of that will be returned.
	def apply_two(operation1, operation2, data) do
		result = operation1.(data)
		operation2.(result)
	end
	
	#Takes some data and two functions, the first function with two parameters and the second function with 
	#one parameter and applies the first function to that data, with the second function fed the result
	#of the first function. The result of that will be returned.
	def apply_two(operation1, operation2, data1, data2) do
		result = operation1.(data1, data2)
		operation2.(result)
	end
end