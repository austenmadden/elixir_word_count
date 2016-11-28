defmodule FileReader do
  defp count_words(file) do
    File.stream!(file)
    |> Enum.flat_map(&String.split/1)
    |> Enum.reduce(%{}, fn word, map -> Map.update(map, word, 1, & &1 + 1) end)
    |> Enum.sort(&(elem(&1, 1) > elem(&2, 1)))
  end

  def print_counts(file) when is_bitstring(file) do
    Enum.map(count_words(file), fn {k, v} ->
      IO.puts "#{k}: #{v}" end)
  end

  def print_counts(_), do: IO.puts "Error, check input"

  def print_counts, do: IO.puts "Error, requires file name input"
end
