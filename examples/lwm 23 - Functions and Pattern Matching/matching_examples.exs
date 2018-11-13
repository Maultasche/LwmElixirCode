defmodule MatchingExamples do
	def do_something([head | tail], {_, second}), do: {head, tail, second}
	def do_something([], {first, _}), do: first
	def do_something([]), do: 3
	
	def generic_specific([]), do: "specific"
	def generic_specific(_), do: "generic"
	
	def generic_specific_wrong_order(_), do: "generic"
	def generic_specific_wrong_order([]), do: "specific"	

	def generic_specific_named([]), do: "specific"
	def generic_specific_named(number_list), do: "generic " <> Integer.to_string(length(number_list))	
	
	def print_name(name), do: print_name(name, :english)
	def print_name(%{first: first_name, last: last_name}, :english) do
		IO.puts("#{first_name} #{last_name}")
	end		
	def print_name(%{first: first_name, last: last_name}, :hungarian) do
		IO.puts("#{last_name} #{first_name}")
	end	
	
	def bob_map?(%{name: "Bob"}), do: true
	def bob_map?(_), do: false
	
	def decompose_list(list = [ head | tail]) do
		{head, tail, length(list)}
	end
		
	def bob_keys(bob_map = %{name: "Bob"}) do
		Map.keys(bob_map)
	end
end