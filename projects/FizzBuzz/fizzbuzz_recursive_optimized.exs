defmodule FizzBuzz do
	def perform_count(total_count) do
		total_count
		|> count([])
		|> print()
	end
	
	#The base case: gets called when count is 0
	defp count(0, output) do
		output
	end
	
	#Gets called when the count is divisible by 3 and 5
	defp count(count, output) when rem(count, 3) == 0 and rem(count, 5) == 0 do
		count(count - 1, ["fizzbuzz" | output])
	end
	
	#Gets called when the count is divisible by 3
	defp count(count, output) when rem(count, 3) == 0 do
		count(count - 1, ["fizz" | output])
	end
	
	#Gets called when the count is divisible by 5
	defp count(count, output) when rem(count, 5) == 0 do
		count(count - 1, ["buzz" | output])
	end
	
	#Gets called when the count is not divisible by 3 or 5
	defp count(count, output) do
		count(count - 1, [Integer.to_string(count) | output])
	end
	
	#Prints out the contents of a list
	defp print([head | tail]) do
		IO.puts(head)
		
		print(tail)
	end
		
	#Base case: prints out an empty list
	defp print([]) do
	end
end