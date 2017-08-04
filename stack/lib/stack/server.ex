defmodule Stack.Server do
  use GenServer

  #####
  # 外部API

  def start_link(list) do
    GenServer.start_link(__MODULE__, list, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(item) do
    GenServer.cast __MODULE__, {:push, item}
  end

  #####
  # GenServerの実装

  def handle_call(:pop, _from, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, v}, current_list) do
    { :noreply, current_list ++ [v] }
  end
end
