alias ProtocolExample.{Animal, Cat, Sheep, Shark}

defmodule ProtocolExample.CLI do
  @type animal :: Animal.t()

  @doc """
  This is the main CLI entry point

  This function currently ignores any command line arguments
  """
  def main(argv) do
    argv
    |> parse_args()
    |> process()
  end

  @doc """
  Parses the command line arguments and returns the results

  Current options:
    --noansi, which turns ANSI output off
  """
  @spec parse_args(keyword()) :: %{ansi: boolean()}
  def parse_args(argv) do
    OptionParser.parse(argv, switches: [noansi: :boolean])
    |> elem(0)
    |> convert_to_options_map()
  end

  @spec convert_to_options_map(keyword()) :: %{ansi: boolean()}
  def convert_to_options_map(options) do
    #In a real app, I'd probably use an options struct instead
    #of a generic map
    %{
      ansi: ansi_option(options)
    }
  end

  defp ansi_option(options) do
    not(Keyword.get(options, :noansi, false))
  end

  @doc """
  Runs the program logic
  """
  @spec process(map()) :: :ok
  def process(options) do
    #Create the animals
    animals = create_animals()

    #Display the animal information
    display_animals_info(animals, options.ansi)
  end

  @doc """
  Creates a list of animals

  These are structs that implement the Animal protocol
  """
  @spec create_animals() :: list(animal())
  def create_animals() do
    [
      %Cat{name: "Fluffy"},
      %Shark{tag_number: "6433"},
      %Cat{name: "Sparky"},
      %Sheep{name: "Wooly", flock: "A"},
      %Shark{tag_number: "432"},
      %Sheep{name: "Tex", flock: "B"},
      %Sheep{name: "Splat", flock: "A"}
    ]
  end

  @doc """
  Displays information on the screen describing the list of animals
  """
  @spec display_animals_info(list(animal), boolean()) :: :ok
  def display_animals_info(animals, use_ansi) do
    animals
    |> Enum.with_index(1)
    |> Enum.each(fn animal -> display_animal_info(animal, use_ansi) end)
  end

  @doc """
  Displays information on the screen describing a single animal
  """
  @spec display_animal_info({animal(), integer()}, boolean()) :: :ok
  def display_animal_info({animal, number}, use_ansi) do
    IO.puts "-------------"
    IO.puts("Animal ##{number} is a #{Animal.type(animal)} named #{Animal.name(animal)}")

    animal_sound = animal_sound_to_display_string(Animal.speak(animal))

    IO.puts("#{Animal.name(animal)} says #{animal_sound}")

    likes_mice = Animal.likes?(animal, :mice)
    likes_grass = Animal.likes?(animal, :grass)
    likes_seals = Animal.likes?(animal, :seals)

    display_like_text(Animal.name(animal), "mice", likes_mice, use_ansi)
    display_like_text(Animal.name(animal), "grass", likes_grass, use_ansi)
    display_like_text(Animal.name(animal), "seals", likes_seals, use_ansi)
  end

  @spec display_like_text(String.t(), String.t(), boolean(), boolean()) :: :ok
  defp display_like_text(animal_name, food_name, true, use_ansi) do
    create_ansi_like_text(animal_name, food_name, "likes",
      IO.ANSI.green, use_ansi)
    |> IO.puts()
  end
  defp display_like_text(animal_name, food_name, false, use_ansi) do
    create_ansi_like_text(animal_name, food_name, "does not like",
      IO.ANSI.red, use_ansi)
    |> IO.puts()
  end

  @spec create_ansi_like_text(String.t(), String.t(), String.t(),
    String.t(), boolean()) :: String.t()
  defp create_ansi_like_text(animal_name, food_name, like_text, ansi_color, true) do
    "#{animal_name} #{ansi_color}#{like_text} " <>
      "#{IO.ANSI.default_color()}#{food_name}"
  end
  defp create_ansi_like_text(animal_name, food_name, like_text, _, false) do
    "#{animal_name} #{like_text} #{food_name}"
  end

  @spec animal_sound_to_display_string(String.t() | nil) :: String.t()
  defp animal_sound_to_display_string(sound) when sound == nil do
    "nothing"
  end
  defp animal_sound_to_display_string(sound) do
    "\"#{sound}\""
  end
end
