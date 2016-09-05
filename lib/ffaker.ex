defmodule Ffaker do
  @moduledoc """
  Common modules
  """

  @doc """
  random by ExTest seed

  It returns random element

  ## Examples

      iex> Ffaker.random(0..100)
      12
  """
  @spec random(Enum.t) :: any
  def random(list) do
    Ffaker.Seed.next
    Enum.random(list)
  end

  @doc """
  make list from file

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
end
