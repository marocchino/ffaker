defmodule Ffaker do
  alias Ffaker.Seed
  @moduledoc """
  Common modules
  """

  @doc """
  random by custom seed

  It returns random element of enumerable

  ## Examples

      iex> Ffaker.random(0..100)
      12
  """
  @spec random(Enum.t) :: any | no_return
  def random(enumerable) do
    Seed.next
    Enum.random(enumerable)
  end

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
end
