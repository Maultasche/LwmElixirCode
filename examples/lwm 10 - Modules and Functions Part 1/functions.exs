defmodule ExampleModule do
  def do_something(parameter1, parameter2) do

  end

  def sum(num1, num2) do
    num1 + num2
  end

  def do_something(parameter1) do
    parameter1
  end

  def echo(parameter1) do
    parameter1
  end
  
  def subtract(num1, num2), do: num1 - num2
  
  def hello(), do: "hello"
  
  def say_something(func), do: IO.puts(func.())
end
