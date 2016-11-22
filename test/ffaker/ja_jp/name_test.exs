defmodule Ffaker.JaJp.NameTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.JaJp.Name
  import Ffaker.Matcher, only: [assert_match: 2]

  test "name/0" do
    assert_match(~r/\A.+\z/, name())
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
end
