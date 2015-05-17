defmodule Stack do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], [])
  end

  def pop(server) do
    GenServer.call(server, :pop)
  end

  def push(server, value) do
    GenServer.cast(server, { :push, value })
  end

  def handle_call(:pop,  _from, []) do
    { :reply, nil, [] }
  end

  def handle_call(:pop, _from, list) do
    [ head|new_list ] = list
    { :reply, head, new_list }
  end

  def handle_cast({ :push, value }, list) do
    { :noreply, [value | list] }
  end
end
