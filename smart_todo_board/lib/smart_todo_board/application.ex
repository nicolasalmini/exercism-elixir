defmodule SmartTodoBoard.Application do
  use Application

  def start(_type, _args) do
    children = [
      # Supervisors and GenServers go here
      SmartTodoBoard.TaskList
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: SmartTodoBoard.Supervisor)
  end
end
