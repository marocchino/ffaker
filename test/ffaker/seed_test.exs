defmodule Ffaker.SeedTest do
  use ExUnit.Case, async: true
  import Ffaker.Seed

  test "reset/0" do
    reset()
    first = Enum.map([1..10, 1..10, 1..10], &Enum.random/1)
    reset()
    second = Enum.map([1..10, 1..10, 1..10], &Enum.random/1)
    assert first == second
  end
end
