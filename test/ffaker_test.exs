defmodule FfakerTest do
  use ExUnit.Case, async: true
  import Ffaker

  test "random/1" do
    assert random(1..1000) in 1..1000
  end

  test "list_file/1" do
    assert list_file("test/data/number") == ~w(1 2 3)
    assert_raise RuntimeError, fn ->
      list_file("not_exists")
    end
  end
end
