defmodule FizzBuzz do
	def perform_count(total_count) do
		total_count
		|> count()
		|> print()
	end
	
	#Maps an integer range to FizzBuzz output
	defp count(count) do
		Enum.map(1..count, &number_to_fizzbuzz/1)
	end
	
	#Gets called when the number is divisible by 3 and 5
	defp number_to_fizzbuzz(number) when rem(number, 3) == 0 and rem(number, 5) == 0 do
		"fizzbuzz"
	end
	
	#Gets called when the number is divisible by 3
	defp number_to_fizzbuzz(number) when rem(number, 3) == 0 do
		"fizz"
	end
	
	#Gets called when the number is divisible by 5
	defp number_to_fizzbuzz(number) when rem(number, 5) == 0 do
		"buzz"
	end
	
	#Gets called when the number is not divisible by 3 or 5
	defp number_to_fizzbuzz(number) do
		Integer.to_string(number)
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