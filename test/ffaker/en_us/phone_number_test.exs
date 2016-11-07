defmodule Ffaker.EnUs.PhoneNumerTest do
  use ExUnit.Case, async: true
  import Ffaker.EnUs.PhoneNumer
  import Ffaker.Matcher, only: [assert_match: 2, assert_in_file: 3]

  @path "en_us/phone_number"

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
    assert_in_file(phone_calling_code(), "phone_calling_codes", @path)
  end

  test "imei/1" do
    assert imei("123456") == "001245001234569"
  end

  test "imei/0" do
    assert_match ~r/\A\d{15}\z/, imei("123456")
  end
end
