defmodule Spawn do
  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}" }
        greet() # 再びmessageを待つようにする. これがないと1回返答したあとprocessを終了する.
    end
  end
end

# client
pid = spawn(Spawn, :greet, [])

# first
send pid, {self(), "World!"}
receive do
  {:ok, msg} ->
    IO.puts msg
end

# second
send pid, {self(), "Kermit!"}
receive do
  {:ok, msg} ->
    IO.puts msg
  after 500 -> # messageが返ってこないと永遠に待ち状態になる-> afterを利用して回避
    IO.puts "The greeter has gone away"
end

