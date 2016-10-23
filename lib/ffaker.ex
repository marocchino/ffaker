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
end
