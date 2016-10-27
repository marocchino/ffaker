defmodule Ffaker.EnUs.AddressTest do
  use ExUnit.Case, async: true
  import Ffaker.EnUs.Address
  import Ffaker.Matcher, only: [assert_match: 2, assert_in_file: 3]
  @path "en_us/address"

  test "zip_code/0" do
    assert_match ~r/\A\d{5}(?:-\d{4})?\z/, zip_code
  end

  test "city/0" do
    assert_match ~r/\A[\w ]+\z/, city
  end

  test "neighborhood/0" do
    assert_in_file(neighborhood, "neighborhoods", @path)
  end

  test "street/0" do
    assert_match ~r/\A[\w. ]+\z/, street
  end

  test "state/0" do
    assert_in_file(state, "states", @path)
  end

  test "state_abbr/0" do
    assert_in_file(state_abbr, "states_abbrs", @path)
  end

  test "state_and_territory_abbr/0" do
    assert_in_file(state_and_territory_abbr,
                   "states_and_territories_abbrs", @path)
  end

  test "continental_state/0" do
    actual = continental_state
    assert_in_file(actual, "states", @path)
    refute actual in ~w(Hawaii Alaska)
  end

  test "continental_state_abbr/0" do
    actual = continental_state_abbr
    assert_in_file(actual, "states_abbrs", @path)
    refute actual in ~w(HI AK)
  end
end
