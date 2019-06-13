#This module defines a Shark struct
defmodule ProtocolExample.Shark do
  defstruct tag_number: nil

  @sound nil
  @animal_type "shark"
  @foods [:fish, :seals, :people]

  @spec foods() :: list(atom())
  def foods(), do: @foods

  @spec type() :: String.t()
  def type(), do: @animal_type

  @spec sound() :: String.t() | nil
  def sound(), do: @sound
end

alias ProtocolExample.Animal
alias ProtocolExample.Shark

#This implements the Animal protocol for the Shark struct
defimpl Animal, for: Shark do
  def type(_shark), do: Shark.type()
  def speak(_shark), do: Shark.sound()
  def likes?(_shark, food), do: food in Shark.foods()
  def name(shark), do: "##{shark.tag_number}"
end

