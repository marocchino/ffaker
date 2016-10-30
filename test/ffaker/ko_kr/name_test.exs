defmodule Ffaker.KoKr.NameTest do
  use ExUnit.Case, async: true
  import Ffaker.KoKr.Name
  import Ffaker.Matcher, only: [assert_match: 2, assert_in_file: 3]
  @path "ko_kr/name"

  test "name_with_space/0" do
    [last_name, first_name] = String.split(name_with_space, " ")

    assert_in_file(first_name,
                   ["male_first_names", "female_first_names"], @path)
    assert_in_file(last_name, "last_names", @path)
  end

  test "name/0" do
    assert_match(~r/\A[가-힇]+\z/, name)
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
end
