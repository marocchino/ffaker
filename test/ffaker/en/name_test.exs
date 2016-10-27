defmodule Ffaker.En.NameTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Name
  import Ffaker.Matcher, only: [assert_in_file: 3]
  @path "en/name"

  test "name/0" do
    [first_name, last_name] = String.split(name, " ")

    assert_in_file(first_name,
                   ["male_first_names", "female_first_names"], @path)
    assert_in_file(last_name, "last_names", @path)
  end

  test "html_safe_name/0" do
    [first_name, last_name] = String.split(html_safe_name, " ")
    assert_in_file(first_name,
                   ["male_first_names", "female_first_names"], @path)
    assert_in_file(last_name, "last_names", @path)
    refute String.contains?(last_name, "'")
  end

  test "first_name/0" do
    assert_in_file(first_name,
                   ["male_first_names", "female_first_names"], @path)
  end

  test "male_first_name/0" do
    assert_in_file(male_first_name, "male_first_names", @path)
  end

  test "female_first_name/0" do
    assert_in_file(female_first_name, "female_first_names", @path)
  end

  test "last_name/0" do
    assert_in_file(last_name, "last_names", @path)
  end

  test "html_safe_last_name/0" do
    actual = html_safe_last_name
    assert_in_file(actual, "last_names", @path)
    refute String.contains?(actual, "'"), "#{actual} contains '"
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
