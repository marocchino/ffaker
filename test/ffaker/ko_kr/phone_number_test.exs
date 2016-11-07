defmodule Ffaker.KoKr.PhoneNumerTest do
  use ExUnit.Case, async: true
  import Ffaker.KoKr.PhoneNumer
  import Ffaker.Matcher, only: [assert_match: 2]

  test "phone_number/0" do
    assert_match ~r/\A0\d{1,2}-\d{4}-\d{4}\z/, phone_number()
  end

  test "home_phone_number/0" do
    assert_match ~r/\A0\d{1,2}-\d{4}-\d{4}\z/, home_phone_number()
  end

  test "mobile_phone_number/0" do
    assert_match ~r/\A0\d{2}-\d{4}-\d{4}\z/, mobile_phone_number()
  end

  test "international_phone_number/0" do
    assert_match ~r/\A\+81 \d{1,2}-\d{4}-\d{4}\z/, international_phone_number()
  end

  test "international_home_phone_number/0" do
    assert_match ~r/\A\+81 \d{1,2}-\d{4}-\d{4}\z/,
                 international_home_phone_number()
  end

  test "international_mobile_phone_number/0" do
    assert_match ~r/\A\+81 \d{1,2}-\d{4}-\d{4}\z/,
                 international_mobile_phone_number()
  end
end
