# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{plots: [], index: 0} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state.plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      new_plot = %Plot{
        plot_id: state.index + 1,
        registered_to: register_to
      }

      {new_plot, %{plots: [new_plot | state.plots], index: state.index + 1}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn state ->
      %{index: state.index, plots: Enum.reject(state.plots, &(&1.plot_id) == plot_id)}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state ->
      case Enum.find(state.plots, &(&1.plot_id) == plot_id) do
        plot when is_map(plot) -> plot
        _ -> {:not_found, "plot is unregistered"}
      end
    end)
  end
end
