defmodule FileTransformerWithMessages do
	#Transforms the text in the input file and writes it to the output file
	def transform(input_file_name, output_file_name) do
		IO.puts "Creating the input stream"
		
		input_stream = File.stream!(input_file_name, [:utf8, :read_ahead], :line)
		
		IO.puts "Creating the output stream"
		
		output_stream = File.stream!(output_file_name, [:utf8, :delayed_write], :line)	
		
		transform_stream(input_stream, output_stream)
	end
	
	#Transforms the text in the input stream and writes it into the output stream
	defp transform_stream(input_stream, output_stream) do
		IO.puts "Transforming the stream"
		IO.puts "-------------------------------"
		
		input_stream 
		|> print_emitted_lines("input file stream")
		|> Stream.chunk_every(2) 
		|> print_emitted_chunks("chunked line stream")
		|> join_lines() 
		|> add_newline() 
		|> print_emitted_lines("merged line stream with newlines")
		|> Stream.each(fn line -> IO.puts ~s(Writing "#{replace_newline(line)}" to output stream) end)
		|> Stream.into(output_stream) 
		|> Stream.each(fn _ -> IO.puts "-------------------------------" end)
		|> Stream.run()	
		
		IO.puts "Transform Finished"
	end
	
	#Joins the lines from a stream of multi-line chunks into a single line with a space separator
	defp join_lines(stream) do
		stream 
		|> trim_chunk() 
		|> print_emitted_chunks("trimmed chunk stream")
		|> merge_chunk()
		|> print_emitted_lines("merged line stream")
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
	
	#Replaces the newline character with "\n" so that we can show the newline in the string
	#without actually printing a newline
	defp replace_newline(string) do
		String.replace(string, "\n", "\\n")
	end

	#Adds double quote characters to the front and back of a string
	defp add_quotes(string) do
		~s(") <> string <> ~s(")
	end
	#Outputs the lines that are emitted from the stream
	defp print_emitted_lines(stream, stream_name) do
		Stream.each(stream, fn line -> IO.puts ~s(Emitting "#{replace_newline(line)}" from #{stream_name}) end)	
	end

	#Outputs the chunks that are emitted from the stream
	defp print_emitted_chunks(stream, stream_name) do
		Stream.each(stream, fn chunk -> 
			trimmed_chunk = Enum.map(chunk, &replace_newline/1)
			quoted_chunk = Enum.map(trimmed_chunk, &add_quotes/1)
			IO.puts ~s(Emitting a chunk, [#{Enum.join(quoted_chunk, ", ")}], from #{stream_name}) 
		end)  
	end
	
end