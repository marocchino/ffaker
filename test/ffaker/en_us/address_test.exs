defmodule Ffaker.EnUs.AddressTest do
  use ExUnit.Case, async: true
  import Ffaker.EnUs.Address
  import Ffaker, only: [list_file: 1]

  test "zip_code/0" do
    actual = zip_code
    assert Regex.match?(~r/\A\d{5}(?:-\d{4})?\z/, actual),
           "#{actual} is not matched"
  end

  test "city/0" do
    actual = city
    assert Regex.match?(~r/\A[\w ]+\z/, actual),
           "#{actual} is not matched"
  end

  test "neighborhood/0" do
    neighborhoods = "data/en_us/address/neighborhoods" |> list_file
    assert neighborhood in neighborhoods
  end

  test "street/0" do
    actual = street
    assert Regex.match?(~r/\A[\w. ]+\z/, actual),
           "#{actual} is not matched"
  end

  test "state/0" do
    states = "data/en_us/address/states" |> list_file
    assert state in states
  end

  test "state_abbr/0" do
    states_abbrs = "data/en_us/address/states_abbrs" |> list_file
    assert state_abbr in states_abbrs
  end

  test "state_and_territory_abbr/0" do
    states_and_territories_abbrs =
      "data/en_us/address/states_and_territories_abbrs" |> list_file
    assert state_and_territory_abbr in states_and_territories_abbrs
  end

  test "continental_state/0" do
    states = "data/en_us/address/states" |> list_file
    actual = continental_state
    assert actual in states
    refute actual in ~w(Hawaii Alaska)
  end

  test "continental_state_abbr/0" do
    states_abbrs = "data/en_us/address/states_abbrs" |> list_file
    actual = continental_state_abbr
    assert actual in states_abbrs
    refute actual in ~w(HI AK)
  end
end
