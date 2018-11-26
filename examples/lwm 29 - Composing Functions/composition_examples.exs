defmodule CompositionExamples do
	def process_list(list) do
		Enum.reverse(Enum.sort(Enum.filter(Enum.map(list, fn number -> number * 2 end), fn number -> number < 100 end)))
	end
	
	def process_list_pipelined(list) do
		list
		|> Enum.map(fn number -> number * 2 end)
		|> Enum.filter(fn number -> number < 100 end)
		|> Enum.sort()
		|> Enum.reverse()
	end	
end