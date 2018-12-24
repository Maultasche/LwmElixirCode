defmodule FileTransformer do
	#Transforms the text in the input file and writes it to the output file
	def transform(input_file_name, output_file_name) do
		input_stream = File.stream!(input_file_name, [:utf8, :read_ahead], :line)
		output_stream = File.stream!(output_file_name, [:utf8, :delayed_write], :line)	
		
		transform_stream(input_stream, output_stream)
	end
	
	#Transforms the text in the input stream and writes it into the output stream
	defp transform_stream(input_stream, output_stream) do
		input_stream 
		|> Stream.chunk_every(2) 
		|> join_lines() 
		|> add_newline() 
		|> Stream.into(output_stream) 
		|> Stream.run()	
	end
	
	#Joins the lines from a stream of multi-line chunks into a single line with a space separator
	defp join_lines(stream) do
		stream |> trim_chunk() |> merge_chunk()		
	end

	#Removes whitespace characters at the end of each line in the chunk
	defp trim_chunk(stream) do
		Stream.map(stream, fn chunk -> Enum.map(chunk, &String.trim_trailing/1) end)
	end

	#Merges each line in the chunk into a single line with a space separator
	defp merge_chunk(stream) do
		Stream.map(stream, fn chunk -> Enum.join(chunk, " ") end)
	end
	
	#Adds a newline character to the end of some text
	defp add_newline(stream) do
		Stream.map(stream, fn text -> text <> "\n" end)
	end
end