defmodule Ffaker.EnUs.AddressTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.EnUs.Address
  import Ffaker.Matcher, only: [assert_match: 2]

  test "zip_code/0" do
    assert_match ~r/\A\d{5}(?:-\d{4})?\z/, zip_code()
  end

  test "city/0" do
    assert_match ~r/\A[\w ]+\z/, city()
  end

  test "neighborhood/0" do
    assert neighborhood() in ~F(neighborhoods)
  end

  test "street/0" do
    assert_match ~r/\A[\w. ]+\z/, street()
  end

  test "state/0" do
    assert state() in ~F(states)
  end

  test "state_abbr/0" do
    assert state_abbr() in ~F(states_abbrs)
  end

  test "state_and_territory_abbr/0" do
    assert state_and_territory_abbr() in ~F(states_and_territories_abbrs)
  end

  test "continental_state/0" do
    actual = continental_state()
    assert actual in ~F(states)
    refute actual in ~w(Hawaii Alaska)
  end

  test "continental_state_abbr/0" do
    actual = continental_state_abbr()
    assert actual in ~F(states_abbrs)
    refute actual in ~w(HI AK)
  end
end
