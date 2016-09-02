defmodule Ffaker.En.NameTest do
  use ExUnit.Case, async: true
  doctest Ffaker.En.Name
  import Ffaker
  import Ffaker.En.Name

  test "name/0" do
    [first_name, last_name] = String.split(name, " ")

    last_names = list_file("data/en/name/last_names")
    first_names = list_file("data/en/name/first_names_male") ++
      list_file("data/en/name/first_names_female")
    assert first_name in first_names
    assert last_name in last_names
  end

  test "html_safe_name/0" do
    [first_name, last_name] = String.split(html_safe_name, " ")

    last_names = list_file("data/en/name/last_names")
    first_names = list_file("data/en/name/first_names_male") ++
      list_file("data/en/name/first_names_female")
    assert first_name in first_names
    assert last_name in last_names
    refute String.contains?(last_name, "'")
  end

  test "first_name/0" do
    first_names = list_file("data/en/name/first_names_male") ++
      list_file("data/en/name/first_names_female")
    assert first_name in first_names
  end

  test "male_first_name/0" do
    first_names = list_file("data/en/name/first_names_male")
    assert male_first_name in first_names
  end

  test "female_first_name/0" do
    first_names = list_file("data/en/name/first_names_female")
    assert female_first_name in first_names
  end

  test "last_name/0" do
    last_names = list_file("data/en/name/last_names")
    assert last_name in last_names
  end

  test "html_safe_last_name/0" do
    last_names = list_file("data/en/name/last_names")
    assert html_safe_last_name in last_names
    refute String.contains?(last_name, "'")
  end

  test "prefix/0" do
    assert prefix in ~w(Mrs. Miss. Mr. Ms. Dr.)
  end

  test "male_prefix/0" do
    assert male_prefix == "Mr."
  end

  test "female_prefix/0" do
    assert female_prefix in ~w(Mrs. Miss.)
  end

  test "other_prefix/0" do
    assert other_prefix in ~w(Ms. Dr.)
  end

  test "suffix/0" do
    assert suffix in ~w(Jr. Sr. I II III IV V MD DDS PhD DVM)
  end
end
