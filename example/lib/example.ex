defmodule Example do
  use Application

  def start(_type, _args) do
    # code
    IO.puts(Example.hello)
    # {:ok, self()}
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def hello do
    :"Hello, world!"
  end
end
