defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    average = sum / Enum.count(numbers)
    {sum, average}
  end

  def print_number(numbers) do
    numbers |> Enum.join(" ") |> IO.puts()
  end

  def get_numbers_from_user do
    IO.puts("Enter numbers separated by spaces:")
    input = IO.gets("") |> String.trim()
    String.split(input, " ") |> Enum.map(&String.to_integer/1)
  end

  def main do
    numbers = get_numbers_from_user()
    IO.inspect(numbers)
    print_number(numbers)
    IO.inspect(sum_and_average(numbers))
  end
end
