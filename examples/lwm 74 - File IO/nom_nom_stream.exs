defmodule NomNomIO do
  @nom_text "om nom nom"

  def nom(input_file_path, output_file_path) do
    #Open file streams for the input and output files
    input_stream = File.stream!(input_file_path, [:utf8])
    output_stream = File.stream!(output_file_path, [:utf8])

    #Nomify the food, writing the results to the output file
    nomify_food(input_stream, output_stream)
  end

  #Starts the process of reading food from the input stream and
  #writing the food plus the nom text to the output stream
  defp nomify_food(input_stream, output_stream) do
    input_stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&concat_nom_text/1)
    |> Stream.map(&add_newline/1)
    |> Stream.into(output_stream)
    |> Stream.run()
  end

  #Concats the nom text to a food
  defp concat_nom_text(food) do
    food <> " " <> @nom_text
  end

  #Adds a newline to the end of a string
  defp add_newline(text) do
    text <> "\n"
  end
end
