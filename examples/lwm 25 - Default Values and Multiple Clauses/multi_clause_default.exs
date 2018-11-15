defmodule MultiClauseDefault do
	def do_something(param1, param2 \\ 3)
	
	def do_something(param1, param2) when is_integer(param1) do
		{param1 * 10, param2}
	end
	
	def do_something(param1, param2) when is_float(param1) do
		{param1 * 100, param2}
	end
end