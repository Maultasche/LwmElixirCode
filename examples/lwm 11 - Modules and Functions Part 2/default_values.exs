defmodule DefaultValues do
	# def create_list(a, b \\ 1, c, d) do
		# [a, b, c, d]
	# end
	
	def create_list(a, b \\1, c \\ 2, d \\ 3) do
		[a, b, c, d]
	end
	
	def do_something(item, count \\ 1) do
		count
	end
end