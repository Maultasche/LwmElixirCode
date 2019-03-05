defmodule BehaviorExample.CLI do
    @moduledoc """
    This module handles the command line interface portion of
    the application.
    """

    @doc """
    This is the main CLI entry point

    This function currently ignores any command line arguments
    """
    def main(_argv) do
      process()
    end

    @doc """
    Runs the program logic
    """
    @spec process() :: :ok
    def process() do
      log_list = fill_log_list([])

      logger = get_random_logger()
      log_list = logger.log_data(log_list, get_random_log_level(),
        %{name: "Zim", occupation: :invader})

      print_log_list(log_list)
    end

    #Returns a random log level
    defp get_random_log_level() do
      Enum.random([:info, :warning, :error])
    end

    #Returns a random logger implementation
    defp get_random_logger() do
      Enum.random([BehaviorExample.LowerCaseLogger, BehaviorExample.UpperCaseLogger])
    end

    @doc """
    Prompts the user for log entries until the user enters
    nothing
    """
    def fill_log_list(log_list) do
      #Get what the user types in and handle it
      IO.gets("> ") |> String.trim() |> handle_message(log_list)
    end

    #Handles the log message entered by the user
    defp handle_message("", log_list), do: log_list
    defp handle_message(message, log_list) do
      #Get a random logger
      logger = get_random_logger()

      #Log the message to the log list
      log_list = logger.log_message(log_list, get_random_log_level(), message)

      #Go back for more
      fill_log_list(log_list)
    end

    @doc """
    Prints a log list to the console
    """
    def print_log_list(log_list) do
      print_separator()

      log_list
      |> Enum.reverse()
      |> Enum.each(&print_log_entry/1)
    end

    #Prints a separator to separate content
    defp print_separator(), do: IO.puts("----------------------")

    #Displays a log entry on its own line in the console
    defp print_log_entry(log_entry) do
      log_entry
      |> get_printable_log_entry()
      |> IO.puts()
    end

    #Returns a printable string that corresponds to the log entry
    defp get_printable_log_entry(log_entry) do
      log_level = get_printable_log_level(log_entry)
      log_message = get_printable_log_message(log_entry)

      "#{log_level} - #{log_message}"
    end

    #Returns a printable string that corresponds to the log level
    defp get_printable_log_level(log_entry) do
      "#{inspect(elem(log_entry, 0))}"
    end

    #Returns a printable string that corresponds to the log message
    defp get_printable_log_message(log_entry) do
      "\"#{elem(log_entry, 1)} \""
    end
end
