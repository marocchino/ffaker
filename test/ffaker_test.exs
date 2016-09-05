defmodule FfakerTest do
  use ExUnit.Case, async: true
  import Ffaker
  import Ffaker.Seed, only: [seed: 0, reset: 0]

  test "random/1" do
    reset
    a = seed
    assert random(1..1000) in 1..1000
    b = seed
    assert a < b
  end

  test "list_file/1" do
    assert list_file("test/data/number") == ~w(1 2 3)
    assert_raise RuntimeError, fn ->
      list_file("not_exists")
    end
  end
end
