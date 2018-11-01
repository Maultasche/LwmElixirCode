defmodule PersonData do
	def get_person() do
		%Person {
			name: "Bob",
			car: %Car {
				make: "Toyota",
				model: "Prius",
				color: "silver",
				manufacturer: %Manufacturer {
					name: "Toyota",
					num_of_factories: 35
				}					
			}
		}
	end
end
