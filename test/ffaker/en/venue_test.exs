defmodule Ffaker.En.VenueTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.En.Venue

  test "name/0" do
    assert name(), ~F(names)
  end
end
