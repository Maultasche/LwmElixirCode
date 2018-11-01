defmodule Person do	
	@enforce_keys [:name, :age]
    defstruct name: "", age: 0, stage: :baby
	
	def new(name, age) do
		%Person{name: name, age: age}
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
