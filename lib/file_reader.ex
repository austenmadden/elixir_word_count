defmodule FileReader do
  def count_words(file) when is_bitstring(file) do
    File.stream!(file)
    |> Enum.flat_map(&String.split/1)
    |> Enum.reduce(%{}, fn word, map -> Map.update(map, word, 1, & &1 + 1) end)
    |> Enum.sort(&(elem(&1, 1) > elem(&2, 1)))
    |> Enum.map(fn {k, v} -> IO.puts "#{k}: #{v}" end)
  end

  def count_words(_), do: IO.puts "Error, check input"

  def count_words, do: IO.puts "Error, requires file"
end
