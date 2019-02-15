defmodule MathModule do
  #Adds two numbers
  def add(x, y), do: x + y
  #Subtracts two numbers
  @spec subtract(number(), number()) :: number()
  def subtract(x, y), do: x - y
end
