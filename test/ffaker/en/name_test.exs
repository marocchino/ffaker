defmodule Ffaker.En.NameTest do
  use ExUnit.Case, async: true
  doctest Ffaker.En.Name
  import Ffaker.En.Name

  test "name/0" do
    [first_name, last_name] = String.split(name, " ")

    last_names = list_file("data/en/name/last_names")
    first_names = list_file("data/en/name/first_names_male") ++
      list_file("data/en/name/first_names_female")
    assert first_name in first_names
    assert last_name in last_names
  end

  test "first_name/0" do
    first_names = list_file("data/en/name/first_names_male") ++
      list_file("data/en/name/first_names_female")
    assert first_name in first_names
  end

  test "first_name_male/0" do
    first_names = list_file("data/en/name/first_names_male")
    assert first_name_male in first_names
  end

  test "first_name_female/0" do
    first_names = list_file("data/en/name/first_names_female")
    assert first_name_female in first_names
  end

  test "last_name/0" do
    last_names = list_file("data/en/name/last_names")
    assert last_name in last_names
  end

  defp list_file(file_name) do
    case File.read(file_name) do
      {:ok, res} ->
        res
        |> String.split("\n")
      {:error, info} -> raise info
    end
  end
end
