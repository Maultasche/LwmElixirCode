defprotocol ProtocolExample.Animal do
  @type food :: atom

  @spec type(Animal.t()) :: String.t()
  def type(animal)

  @spec speak(Animal.t()) :: String.t() | nil
  def speak(animal)

  @spec likes?(Animal.t(),food) :: boolean
  def likes?(animal, food)

  @spec name(Animal.t()) :: String.t()
  def name(animal)
end
