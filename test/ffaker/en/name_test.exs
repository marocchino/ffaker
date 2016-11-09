defmodule Ffaker.En.NameTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.En.Name

  test "name/0" do
    [first_name, last_name] = String.split(name(), " ")

    assert first_name in ~F(male_first_names) ++ ~F(female_first_names)
    assert last_name in ~F(last_names)
  end

  test "html_safe_name/0" do
    [first_name, last_name] = String.split(html_safe_name(), " ")
    assert first_name in ~F(male_first_names) ++ ~F(female_first_names)
    assert last_name in ~F(last_names)
    refute String.contains?(last_name, "'")
  end

  test "first_name/0" do
    assert first_name() in ~F(male_first_names) ++ ~F(female_first_names)
  end

  test "male_first_name/0" do
    assert male_first_name() in ~F(male_first_names)
  end

  test "female_first_name/0" do
    assert female_first_name() in ~F(female_first_names)
  end

  test "last_name/0" do
    assert last_name() in ~F(last_names)
  end

  test "html_safe_last_name/0" do
    actual = html_safe_last_name()
    assert actual in ~F(last_names)
    refute String.contains?(actual, "'"), "#{actual} contains '"
  end

  test "prefix/0" do
    assert prefix() in ~w(Mrs. Miss. Mr. Ms. Dr.)
  end

  test "male_prefix/0" do
    assert male_prefix() == "Mr."
  end

  test "female_prefix/0" do
    assert female_prefix() in ~w(Mrs. Miss.)
  end

  test "other_prefix/0" do
    assert other_prefix() in ~w(Ms. Dr.)
  end

  test "suffix/0" do
    assert suffix() in ~w(Jr. Sr. I II III IV V MD DDS PhD DVM)
  end
end
