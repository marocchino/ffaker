defmodule Ffaker do
  @moduledoc"""
  Common modules
  """

  defmacro __using__(_opts) do
    quote do
      defp sigil_F(file_name, _opts) do
        path =
          __MODULE__
          |> to_string
          |> Macro.underscore
          |> String.replace(~r(elixir.ffaker|_test), "")
        Ffaker.list_file(file_name, path)
      end
    end
  end

  @doc"""
  make list from file

  ## Parameters

    - file_name: data file name
    - dir_path: directory path of file

  ## Examples

      iex> Ffaker.list_file("numbers", "test")
      ["1", "2", "3"]
  """
  @spec list_file(String.t, String.t) :: Enum.t
  def list_file(file_name, dir_path) do
    file_path = "#{__DIR__}/../data/#{dir_path}/#{file_name}"
    case File.read(file_path) do
      {:ok, res} ->
        res
        |> String.trim
        |> String.split("\n")
      {:error, _} -> raise RuntimeError, message: "#{file_path} not found"
    end
  end

  @doc"""
  replace # with number

  ## Parameters

    - string: original string

  ## Examples

      iex> Ffaker.number("##-###")
      "12-345"
  """
  @spec numerify(String.t) :: String.t
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
