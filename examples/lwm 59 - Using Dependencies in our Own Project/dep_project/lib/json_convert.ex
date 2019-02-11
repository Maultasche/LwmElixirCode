defmodule JsonConvert do
  def convert_to_json(data) do
    Poison.encode(data)
  end

  def parse_json(json) do
    Poison.decode(json)
  end
end
