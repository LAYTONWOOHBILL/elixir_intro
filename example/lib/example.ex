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
    date_time = DateTime.new!(Date.new!(2025, 1, 1), Time.new!(0, 0, 0, 0), "Etc/UTC")
    time_till = DateTime.diff(date_time, DateTime.utc_now(), :day)
    IO.puts("Time till New Year: #{time_till} days")
  end
end
