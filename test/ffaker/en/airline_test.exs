defmodule Ffaker.En.AirlineTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.En.Airline
  import Ffaker.Matcher, only: [assert_match: 2]

  test "name/0" do
    assert name() in ~F(names)
  end

  test "flight_number/0" do
    assert_match ~r/[A-Z]{2} \d{1,4}\z/, flight_number()
  end
end
