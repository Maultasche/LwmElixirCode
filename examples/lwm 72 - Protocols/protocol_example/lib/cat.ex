#This module defines a Cat struct
defmodule ProtocolExample.Cat do
  defstruct name: ""

  @sound "meow"
  @animal_type "cat"
  @foods [:catfood, :chicken, :fish, :mice]

  @spec foods() :: list(atom())
  def foods(), do: @foods

  @spec type() :: String.t()
  def type(), do: @animal_type

  @spec sound() :: String.t() | nil
  def sound(), do: @sound
end

alias ProtocolExample.Animal
alias ProtocolExample.Cat

#This implements the Animal protocol for the Cat struct
defimpl Animal, for: Cat do
  def type(_cat), do: Cat.type()
  def speak(_cat), do: Cat.sound()
  def likes?(_cat, food), do: food in Cat.foods()
  def name(cat), do: cat.name
end
