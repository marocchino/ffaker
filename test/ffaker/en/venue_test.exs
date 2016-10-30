defmodule Ffaker.En.VenueTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Venue
  import Ffaker.Matcher, only: [assert_in_file: 3]
  @path "en/venue"

  test "name/0" do
    assert_in_file(name, "names", @path)
  end
end
