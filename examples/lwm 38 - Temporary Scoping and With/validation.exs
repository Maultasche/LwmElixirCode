defmodule Validation do
	def validate_parameters(params) do
		with :ok <- validate_x(params),
			 :ok <- validate_y(params),
			 :ok <- validate_z(params)
		do
			:ok
		else
			err -> err
		end
	end
	
	def validate_x(%{x: value}) when value >= 0 and value <= 100 do
		:ok
	end

	def validate_x(%{x: _}) do
		{:error, "The value of x must be between 0 and 100"}
	end

	def validate_x(_) do
		{:error, "X is missing from the parameters"}
	end

	def validate_y(%{y: value}) when value >= 1 and value <= 10 do
		:ok
	end

	def validate_y(%{y: _}) do
		{:error, "The value of y must be between 1 and 10"}
	end

	def validate_y(_) do
		{:error, "Y is missing from the parameters"}
	end
	
	def validate_z(%{z: value}) when is_binary(value) do
		:ok
	end

	def validate_z(_) do
		{:error, "The value of z must be a string"}
	end
end