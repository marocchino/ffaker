defmodule Ffaker.SeedTest do
  use ExUnit.Case, async: true
  import Ffaker.Seed
  import Ffaker

  test "reset/0" do
    reset
    first = [random(1..10), random(1..10), random(1..10)]
    reset
    second = [random(1..10), random(1..10), random(1..10)]
    assert first == second
  end
end
