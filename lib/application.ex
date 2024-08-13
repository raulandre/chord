defmodule Chord.Application do
  use Application

  @impl true
  def start(_type, _args) do
    {:ok, _pid} = :pg.start_link
  end
end
