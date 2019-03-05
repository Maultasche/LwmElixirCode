defmodule BehaviorExample.LowerCaseLogger do
  @behaviour BehaviorExample.Logger

  alias BehaviorExample.Logger

  @spec log_message(Logger.log_list(), Logger.level(), String.t()) :: Logger.log_list()
  def log_message(log_list, level, message) do
    [{level, String.downcase(message)} | log_list]
  end

  @spec log_data(Logger.log_list(), Logger.level(), any()) :: Logger.log_list()
  def log_data(log_list, level, data) do
    [{level, inspect(data)} | log_list]
  end
end
