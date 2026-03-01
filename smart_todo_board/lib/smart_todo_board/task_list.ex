defmodule SmartTodoBoard.TaskList do
  use Agent

  def start_link(_args \\ []) do
    IO.puts("Starting Task list...")

    # Starting agent with empty map as state
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  @spec add(any()) :: :ok
  def add(task_title) do
    Agent.update(__MODULE__, fn task_list ->
      [
        %{
          id: length(task_list),
          title: task_title,
          completed?: false
        }
      | task_list]
    end)
  end

  def remove(task_item) doPpp
    Agent.update(__MODULE__, fn task_list ->
      Enum.reject(task_list, fn item -> item == task_item end)
    end)
  end

  def list_tasks() do
    Agent.get(__MODULE__, fn task_list -> task_list end)
  end

  def count() do
    Enum.count(Agent.get(__MODULE__, &(&1)))
  end
end
