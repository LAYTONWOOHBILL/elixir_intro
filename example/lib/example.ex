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
    name = "John"
    status = Enum.random([:gold, :silver, :bronze, :platinum])

    # if status == :active do
    #   IO.puts("#{name} is active")
    # else
    #   IO.puts("#{name} is inactive")
    # end

    case status do
      :gold -> IO.puts("Welcome #{name} to the Gold tier")
      :silver -> IO.puts("Welcome #{name} to the Silver tier")
      :bronze -> IO.puts("Welcome #{name} to the Bronze tier")
      _ -> IO.puts("Welcome #{name} to the Platinum tier")
    end
  end
end
