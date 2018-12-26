defmodule StopNumberStream do
	def create(range, stop_number) do
		Stream.resource(fn -> initialize(range, stop_number) end, &generate_next_value/1, &done/1)
	end
	
	defp initialize(range, stop_number) do
		{range, stop_number, false}
	end
	
	defp generate_next_value({range, stop_number, false}) do
		case generated_number = Enum.random(range) do
			^stop_number -> {[stop_number], {range, stop_number, true}}
			_ -> {[generated_number], {range, stop_number, false}}
		end				
	end
	
	defp generate_next_value({_, stop_number, true}) do
		{:halt, stop_number}			
	end			
	
	defp done(_) do
		nil
	end
end