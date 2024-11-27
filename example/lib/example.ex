defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    correct_answer = :rand.uniform(10)
    # IO.puts("The correct answer is #{correct_answer}")
    guess = IO.gets("Guess the number between 1 and 10: ") |> String.trim() |> Integer.parse()
    # IO.inspect(guess)
    case guess do
      {result, ""} -> IO.puts("You guessed #{result}")
        if result == correct_answer do
          IO.puts("You guessed correctly!")
        else
          IO.puts("You lost! The correct answer is #{correct_answer}")
        end
      {result, other}  -> IO.puts("parse partially successful #{result} and #{other}")
      :error -> IO.puts("parse error")
    end
  end
end
