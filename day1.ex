defmodule Day1 do
  @default_name "day1-input.txt"

  def process(name \\ @default_name) do
    case File.read(name) do
      {:ok, content} ->
        "Floor: " <> (which_floor?(content) |> Integer.to_string)
      _ ->
        IO.puts "Error reading " <> name
    end
  end

  def which_floor?(s) do
    next_floor?(s, 0)
  end

  def next_floor?("", floor), do: floor
  def next_floor?("\n", floor), do: floor
  def next_floor?("(" <> rest, current_floor) do
    next_floor?(rest, current_floor + 1)
  end
  def next_floor?(")" <> rest, current_floor) do
    next_floor?(rest, current_floor - 1)
  end
  def next_floor?(s, current_floor) do
    next_floor?(tl(s), current_floor)
  end
end
