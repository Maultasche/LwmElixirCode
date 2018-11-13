defmodule KeywordListExample do
	@default_options [color: "blue", size: "tiny", speed: "low"]
	
	def create_vehicle(registration_number, options \\ []) do
		#Merge the default options with the options that were passed
		options = Keyword.merge(@default_options, options)
		
		%{id: registration_number, color: options[:color], size: options[:size], speed: options[:speed]}
	end
end