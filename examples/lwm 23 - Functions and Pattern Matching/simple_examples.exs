defmodule SimpleExamples do
	def swap({a, b}), do: {b, a}
	
	def first_element([head | _tail]) do
		head
	end	
	
	def empty_list([]) do
		"Yep, it's an empty list"
	end	
	
	def do_something({_, item, _}, item) do
		"Yep, it matched"
	end
end