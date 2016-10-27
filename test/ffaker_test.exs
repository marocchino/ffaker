defmodule FfakerTest do
  use ExUnit.Case, async: true
  import Ffaker
  import Ffaker.Matcher, only: [assert_match: 2]

  test "list_file/2" do
    assert list_file("numbers", "test") == ~w(1 2 3)
    assert_raise RuntimeError, fn ->
      list_file("not_exists", "not_exists")
    end
  end

  test "numerify/1" do
    assert_match ~r/\Aabc \d{3}\z/, numerify("abc ###")
  end
end
