defmodule GuardExamples do
	def divide(number1, number2) when number2 != 0 do
		number1 / number2
	end
	
	def min(num1, num2) when num1 <= num2 do
		num1
	end
	def min(num1, num2) when num1 > num2 do
		num2
	end
	
	def get_type(data) when is_integer(data) do
		:integer
	end
	def get_type(data) when is_atom(data) do
		:atom
	end
	def get_type(data) when is_function(data) do
		:function
	end	
	def get_type(_) do
		:other_type
	end
	
	def is_big_list?(list) when is_list(list) and length(list) < 10 do
		false
	end	
	def is_big_list?(list) when is_list(list) and length(list) >= 10 do
		true
	end	
end