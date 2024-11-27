defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

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

    memberships = %{
      bronze: :bronze,
      silver: :silver,
      gold: :gold,
      platinum: :platinum
    }

    gold_membership = %Membership{type: :gold, price: 30}
    silver_membership = %Membership{type: :silver, price: 20}
    bronze_membership = %Membership{type: :bronze, price: 10}
    platinum_membership = %Membership{type: :platinum, price: 40}

    users = [
      %User{name: "John", membership: gold_membership},
      %User{name: "Jane", membership: silver_membership},
      %User{name: "Jim", membership: bronze_membership},
      %User{name: "Jill", membership: platinum_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} ->
      IO.puts("#{name} is a #{membership.type} member. price is #{membership.price}")
    end)
  end
end
