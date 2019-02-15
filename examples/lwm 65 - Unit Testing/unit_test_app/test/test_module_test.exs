# defmodule TestModule do
# 	use ExUnit.Case, async: true

#   setup do
#     IO.puts "Initial Setup"

# 		on_exit(&cleanup/0)

# 		[
# 			numbers: [3, 4, 5],
# 			status: :sleeping
# 		]
# 	end

# 	setup :define_test_data

#   setup context do
#     IO.puts "Additional Setup"
# 		IO.puts "Current Context: #{inspect(context)}"

# 		:ok
# 	end

#   def define_test_data(_context) do
#     IO.puts "Inside define_test_data"

# 		%{
# 			numbers: [1, 2, 3, 4, 5],
# 			name: "Bob",
# 		}
# 	end

# 	def cleanup() do
# 		IO.puts "Cleaning up after the test"
# 	end

# 	test "Some dummy test", context do
# 		IO.puts "Running the dummy test"
# 		IO.puts "Final Context: #{inspect(context)}"
# 	end
# end
