defmodule DocProject do
  @moduledoc """
  This is the main (and only) module for the doc project, which is intended
  to demonstrate documentation.

  The documentation in this module will be used for generating HTML documentation.
  It will be formatted real nice and pretty with pleasing colors and links.
  Yeah, links! Pretty fancy stuff. All it needs now are some unicorns and rainbows,
  but we ran out.
  """

  @doc ~S"""
  Converts an enumerable into string form

  The contents of the enumerable will be iterated over, converted to a string
  using `Kernel.inspect/1` and put in a comma-separated list surrounded by brackets.

  ## Examples

      iex> DocProject.stringify([])
      "[]"
      iex> DocProject.stringify(["a", "b", "c"])
      "[\"a\", \"b\", \"c\"]"
      iex> DocProject.stringify(1..10)
      "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"

  """
  def stringify(enumerable) do
    comma_string = enumerable
    |> Enum.map(fn element -> inspect(element) end)
    |> Enum.join(", ")

    "[" <> comma_string <> "]"
  end

  @doc """
  Sums the numbers in an enumerable.

  If the enumerable does not contain all numbers, then there will be trouble.

  ## Examples

    iex> DocProject.sum([1, 2, 3, 4, 5])
    15
    iex> DocProject.sum(1..10)
    55
    iex> DocProject.sum([22])
    22
    iex> DocProject.sum([])
    0

  """
  def sum(enumerable) do
    Enum.reduce(enumerable, 0, &Kernel.+/2)
  end
end
