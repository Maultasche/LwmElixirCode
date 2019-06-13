defmodule NomNomIO do
  @nom_text "om nom nom"

  def nom(input_file_path, output_file_path) do
    #Open the files for reading and writing
    input_file = File.open!(input_file_path, [:read, :utf8])
    output_file = File.open!(output_file_path, [:write, :utf8])

    #Nomify the food, writing the results to the output file
    nomify_food(input_file, output_file)

    #Close the files
    File.close(input_file)
    File.close(output_file)
  end

  #Starts the process of reading food from the food file and
  #writing the food plus the nom text to the output file
  defp nomify_food(food_file, output_file) do
    #Read the next food from the food file and trim the whitespace
    food = read_next_food(food_file)

    nomify_food(food_file, output_file, food)
  end

  #Writes the food to the output file with the nom text and
  #reads the next food. This function will recursively call
  #itself until all the food has been read and written to
  #the output file
  defp nomify_food(_, _, nil) do
    :ok
  end
  defp nomify_food(food_file, output_file, food) do
    #Write the food and the nom text to the output file
    write_food(food, @nom_text, output_file)

    #Read the next food from the food file
    food = read_next_food(food_file)

    #Make a recursive call to read the next food
    nomify_food(food_file, output_file, food)
  end

  #Reads the next food from the food file
  defp read_next_food(food_file) do
    #Read the food from the file and trim the whitespace
    food_file
    |> IO.read(:line)
    |> trim_food()
  end

  #Writes the food and the nom text to the output file
  defp write_food(nil, _, _), do: :ok
  defp write_food(food, nom_text, output_file) do
    IO.write(output_file, food)
    IO.write(output_file, " ")
    IO.write(output_file, nom_text)
    IO.write(output_file, "\n")
  end

  #Trims the whitespace off of a food string, unless its an
  #:eof (end of file) atom, which is passed back as a nil
  defp trim_food(:eof) do
    nil
  end
  defp trim_food(food) do
    String.trim(food)
  end
end
