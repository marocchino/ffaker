defmodule Ffaker do
  @moduledoc """
  Common modules
  """

  @doc """
  make list from file

  ## Parameters

    - file_name: data file name

  ## Examples

      iex> Ffaker.list_file("test/data/number")
      ["1", "2", "3"]
  """
  @spec list_file(String.t) :: Enum.t
  def list_file(file_name) do
    case File.read(file_name) do
      {:ok, res} ->
        res
        |> String.trim
        |> String.split("\n")
      {:error, _} -> raise RuntimeError, message: "#{file_name} not found"
    end
  end

  @doc """
  replace # with number

  ## Parameters

    - string: original string

  ## Examples

      iex> Ffaker.number("##-###")
      "12-345"
  """
  def numerify(string) do
    string
    |> String.graphemes
    |> Enum.map(fn x ->
         case x do
           "#" -> 0..9 |> Enum.random |> to_string
           x -> x
         end
       end)
    |> Enum.join
  end
end
