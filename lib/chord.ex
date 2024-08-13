defmodule Chord do
  def connect_ring do
    pids = 
      :pg.get_members(:ring)
      |> Enum.sort

    start = List.first pids
    :global.re_register_name(:ring_start, start)
    set_next(start, pids)
  end

  defp set_next(current, available_pids) do
    case available_pids do
      [] ->
        start = :global.whereis_name(:ring_start)
        GenServer.cast(current, {:set_next, start})
        :ok
      [next | rest] ->
        GenServer.cast(current, {:set_next, next})
        set_next(next, rest)
    end
  end

  def dump_ring do
    :pg.get_members(:ring)
    |> Enum.sort
    |> Enum.map(fn pid -> 
      %{:next => next} = GenServer.call(pid, :dump) 
      "#{inspect pid} -> #{inspect next}"
    end)
  end
end
