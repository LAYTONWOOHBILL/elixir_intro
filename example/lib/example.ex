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
    memberships = {:bronze, :silver}
    memberships = Tuple.append(memberships, :gold)
    IO.inspect(memberships)

    price = {5, 10, 15}
    avg = Tuple.sum(price) / tuple_size(price)
    IO.inspect(avg)

    IO.puts("#{elem(memberships, 0)} #{elem(memberships, 1)} #{elem(memberships, 2)} is #{avg}")

    users = [{"John", :gold}, {"Jane", :silver}, {"Jim", :bronze}]
    users = List.insert_at(users, 0, {"Jill", :platinum})

    Enum.each(users, fn {name, membership} ->
      IO.puts("#{name} is a #{membership} member")
    end)
  end
end
