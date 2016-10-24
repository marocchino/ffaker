defmodule Ffaker.EnUs.PhoneNumerTest do
  use ExUnit.Case, async: true
  import Ffaker.EnUs.PhoneNumer
  import Ffaker

  test "phone_number/0" do
    actual = phone_number
    assert Regex.match?(~r/\A(?:1-)?\d{3}-\d{3}-\d{4}(?: x\d{3,5})?\z/, actual),
           "#{actual} is not matched"
  end

  test "area_code/0" do
    actual = area_code
    assert rem(actual, 100) != 11
    assert actual in 201..999
  end

  test "exchange_code/0" do
    actual = exchange_code
    assert actual in 201..999
  end

  test "short_phone_number/0" do
    actual = short_phone_number
    assert Regex.match?(~r/\A\d{3}-\d{3}-\d{4}\z/, actual),
           "#{actual} is not matched"
  end

  test "phone_calling_code/0" do
    codes = list_file("data/en_us/phone_number/phone_calling_codes")
    assert phone_calling_code in codes
  end

  test "imei/1" do
    assert imei("123456") == "001245001234569"
  end

  test "imei/0" do
    actual = imei("123456")
    assert Regex.match?(~r/\A\d{15}\z/, actual),
           "#{actual} is not matched"
  end
end
