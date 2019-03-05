defmodule BehaviorExample.Logger do
  @type log_list :: list({level(), String.t()})
  @type level :: (:info | :warning | :error)

  @callback log_message(log_list(), level(), String.t()) :: log_list()
  @callback log_data(log_list(), level(), any()) :: log_list()
end
