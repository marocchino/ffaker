defmodule Ffaker do
  @moduledoc """
  Common modules
  """

  @doc """
  random by ExTest seed
  """
  @spec random(Enum.t) :: String.t
  def random(list) do
    s = ExUnit.configuration
        |> Keyword.get(:seed)
    :rand.seed(:exsplus, { s, s, s })
    Enum.random(list)
  end

  @doc """
  make list from file
  """
  @spec list_file(String.t) :: Enum.t
  def list_file(file_name) do
    case File.read(file_name) do
      {:ok, res} ->
        res
        |> String.trim
        |> String.split("\n")
      {:error, info} -> raise info
    end
  end
end
