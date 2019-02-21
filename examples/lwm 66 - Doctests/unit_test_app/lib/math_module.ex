defmodule MathModule do
  @doc """
  Adds two numbers together.

  This is actually a totally unnecessary function, since Elixir already has a
  `Kernel.+/2` function that does exactly the same thing.

  ## Examples
    iex> MathModule.add(3, 4)
    7
    iex> MathModule.add(-2, -4)
    -6
  """
  def add(x, y), do: x + y

  @doc """
  Subtracts one number from another number

  This is actually a totally unnecessary function, since Elixir already has a
  `Kernel.-/2` function that does exactly the same thing.

  ## Examples
    iex> MathModule.subtract(6, 2)
    4
    iex> MathModule.subtract(-2, -4)
    2
  """
  def subtract(x, y), do: x - y
end
