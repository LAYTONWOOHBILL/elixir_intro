defmodule Example do
  use Application
  alias UUID

  def start(_type, _args) do
    # code
    Example.main()
    # {:ok, self()}
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    a = 10
    b = 2
    c = a/b
    IO.puts Integer.gcd(50,18)
  end
end
