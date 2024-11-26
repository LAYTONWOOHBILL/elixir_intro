defmodule Example do
  use Application
  alias UUID

  def start(_type, _args) do
    # code
    IO.puts(Example.hello)
    IO.puts(UUID.uuid4())
    # {:ok, self()}
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def hello do
    :"Hello, world!"
  end
end
