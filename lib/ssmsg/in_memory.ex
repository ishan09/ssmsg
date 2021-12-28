defmodule Ssmsg.InMemory do
  use GenServer

  def start_link(_), do: GenServer.start_link(__MODULE__, [], name: __MODULE__)

  def save_message(message) do
    GenServer.call(__MODULE__, {:save, message})
  end

  def get_message(to) do
    GenServer.call(__MODULE__, {:get, to})
  end

  @impl true
  def init(_) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:save, message}, _, state) do
    updated_state =
      Map.update(state, message.to, [message.message], fn msg_list ->
        [message.message | msg_list]
      end)

    {:reply, :ok, updated_state}
  end

  @impl true
  def handle_call({:get, to}, _, state) do
    result =
      case Map.get(state, to, :not_found) do
        :not_found -> {:error, :not_found}
        list -> {:ok, list}
      end

    {:reply, result, state}
  end
end
