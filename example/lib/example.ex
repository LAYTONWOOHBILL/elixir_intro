defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    grade = [1, 2, 3, 4, 5]
    new = for n <- grade do
      n+5
    end
    IO.inspect(new)
    new = new ++ [125]
    new = new ++ [120, 121, 122]
    IO.inspect(new)
    final = new -- [121]
    final = [5| new]
    new = new ++ [1]
    IO.inspect(final)
    even = for n <- final, rem(n, 2) == 0, do: n
    IO.inspect(even)
  end
end
