defmodule ChordNode do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(init_args) do
    :pg.join(:ring, self())
    Chord.connect_ring
    {:ok, init_args}
  end

  @impl true
  def handle_call(:dump, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:set_next, next}, state) do
    new_state = Map.put(state, :next, next)
    {:noreply, new_state}
  end
end
