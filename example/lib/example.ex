defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    number = ["1", "2", "3", "4", "5"]
    IO.inspect(number)
    res = Enum.map(number, &String.to_integer/1)
    IO.inspect(res)
  end
end
