defmodule Ffaker.BooleanTest do
  use ExUnit.Case, async: true
  import Ffaker.Boolean

  test "maybe/0" do
    assert maybe() in [true, false]
  end
end
