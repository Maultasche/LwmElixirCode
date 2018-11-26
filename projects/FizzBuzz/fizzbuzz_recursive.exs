defmodule FizzBuzz do
	def perform_count(total_count) when total_count >= 0 do
		total_count
		|> count()
		|> Enum.reverse()
		|> print()
	end
	
	#The base case: gets called when count is 0
	defp count(0) do
		[]
	end
	
	#Gets called when the count is divisible by 3 and 5
	defp count(count) when rem(count, 3) == 0 and rem(count, 5) == 0 do
		["fizzbuzz" | count(count - 1)]
	end
	
	#Gets called when the count is divisible by 3
	defp count(count) when rem(count, 3) == 0 do
		["fizz" | count(count - 1)]
	end
	
	#Gets called when the count is divisible by 5
	defp count(count) when rem(count, 5) == 0 do
		["buzz" | count(count - 1)]
	end
	
	#Gets called when the count is not divisible by 3 or 5
	defp count(count) do
		[Integer.to_string(count) | count(count - 1)]
	end

	#Base case: prints out an empty list
	defp print([]) do
	end
	
	#Prints out the contents of a list
	defp print([head | tail]) do
		IO.puts(head)
		
		print(tail)
	end	
end