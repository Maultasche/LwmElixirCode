defmodule Person do	
    defstruct name: "", age: 0, stage: :baby
	
	def new(name) do
		%Person{name: name}
	end
	
	def increment_age(person) do
		%Person{person | age: person.age + 1}
	end
	
	def babify(person) do
		%Person{person | age: 1, stage: :baby}
	end
	
	def can_retire?(person, retirement_age) do
		person.age >= retirement_age
	end	
end
