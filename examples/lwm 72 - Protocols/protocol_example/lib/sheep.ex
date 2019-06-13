#This module defines a Sheep struct
defmodule ProtocolExample.Sheep do
  defstruct name: "", flock: ""

  @sound "baaa"
  @animal_type "sheep"
  @foods [:grass, :hay, :alfalfa]

  @spec foods() :: list(atom())
  def foods(), do: @foods

  @spec type() :: String.t()
  def type(), do: @animal_type

  @spec sound() :: String.t() | nil
  def sound(), do: @sound
end

alias ProtocolExample.Animal
alias ProtocolExample.Sheep

#This implements the Animal protocol for the Sheep struct
defimpl Animal, for: Sheep do
  def type(_sheep), do: Sheep.type()
  def speak(_sheep), do: Sheep.sound()
  def likes?(_sheep, food), do: food in Sheep.foods()
  def name(sheep), do: sheep.name <> " of Flock #{sheep.flock}"
end
