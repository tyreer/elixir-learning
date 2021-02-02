defmodule ControlFlow do
  defp file_to_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.length/1)
  end

  # lines_lengths!/1 takes file path and returns a list of numbers, with each number representing the length of the corresponding line from the file
  def lines_lengths!(path) do
    # file_to_length!(path)
    # |> Enum.to_list()
    File.stream!(path)
    |> Enum.map(&String.length/1)
  end

  # returns the length of the longest line in the file
  def longest_line_length!(path) do
    file_to_length!(path)
    |> Enum.max()
  end

  # returns the contents of the longest line in the file
  def longest_line!(path) do
    File.stream!(path)
    |> Enum.reduce("", &longer_line/2)
  end

  defp longer_line(line1, line2) do
    if String.length(line1) > String.length(line2) do
      line1
    else
      line2
    end
  end

  # returns a list of numbers with each number representing the word count of the line

  def words_per_line!(path) do
    File.stream!(path)
    |> Enum.map(&word_count/1)
  end

  defp word_count(string) do
    string
    |> String.split(" ")
    |> length
  end
end