defmodule RecursiveExamples do
	def biggest_number([number | []]) do
		number
	end
	def biggest_number([number | tail]) do
		max(number, biggest_number(tail))
	end
	
	def sum_unoptimized([]), do: 0
	def sum_unoptimized([head | tail]) do
		head + sum_unoptimized(tail)
	end	
	
	def sum_optimized(list) do
		sum_optimized(list, 0)
	end
	
	defp sum_optimized([head | tail], current_sum) do
		sum_optimized(tail, current_sum + head) 
	end	
	defp sum_optimized([], current_sum), do: current_sum	
end