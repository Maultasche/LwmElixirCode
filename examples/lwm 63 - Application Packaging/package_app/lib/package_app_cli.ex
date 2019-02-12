defmodule PackageApp.CLI do
  def main(argv) do
    #Process the command line arguments and then call another method
    #that will actually run something

    IO.puts "Running PackageApp"
    IO.puts "Command line arguments: #{inspect(argv)}"
  end
end
