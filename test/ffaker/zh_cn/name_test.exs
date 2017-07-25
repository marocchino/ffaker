defmodule Ffaker.ZhCn.NameTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.ZhCn.Name
  import Ffaker.Matcher, only: [assert_match: 2]

  test "name/0" do
    assert_match(~r/\A.+\z/, name())
  end

  test "first_name/0" do
    assert first_name() in ~F(first_names)
  end

  test "last_name/0" do
    assert last_name() in ~F(last_names)
  end
end
