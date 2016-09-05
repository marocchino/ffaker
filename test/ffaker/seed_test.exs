defmodule Ffaker.SeedTest do
  use ExUnit.Case, async: true
  import Ffaker.Seed

  test "reset/0" do
    reset
    first = seed
    next
    reset
    second = seed
    assert first == second
  end
end
