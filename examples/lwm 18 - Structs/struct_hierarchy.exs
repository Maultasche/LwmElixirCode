defmodule Manufacturer do
	defstruct name: "", num_of_factories: 0
end

defmodule Car do
	defstruct make: "", model: "", color: "", manufacturer: %Manufacturer{}
end

defmodule Person do
	defstruct name: "", age: 0, car: %Car{}
end