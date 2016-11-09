defmodule Ffaker.EnUs.PhoneNumberTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.EnUs.PhoneNumber
  import Ffaker.Matcher, only: [assert_match: 2]

  test "phone_number/0" do
    assert_match ~r/\A(?:1-)?\d{3}-\d{3}-\d{4}(?: x\d{3,5})?\z/, phone_number()
  end

  test "area_code/0" do
    actual = area_code()
    assert rem(actual, 100) != 11
    assert actual in 201..999
  end

  test "exchange_code/0" do
    assert exchange_code() in 201..999
  end

  test "short_phone_number/0" do
    assert_match ~r/\A\d{3}-\d{3}-\d{4}\z/, short_phone_number()
  end

  test "phone_calling_code/0" do
    assert phone_calling_code() in ~F(phone_calling_codes)
  end

  test "imei/1" do
    assert imei("123456") == "001245001234569"
  end

  test "imei/0" do
    assert_match ~r/\A\d{15}\z/, imei("123456")
  end
end
