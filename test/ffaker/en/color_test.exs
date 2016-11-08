defmodule Ffaker.En.ColorTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Color
  import Ffaker.Matcher, only: [assert_match: 2, assert_in_file: 3]
  @path "en/color"

  test "name/0" do
    assert_in_file(name(), "names", @path)
  end

  test "hex_code/0" do
    assert_match ~r/\A[0-9A-F]{6}\z/, hex_code()
  end

  test "rgb/0" do
    assert Enum.all?(rgb(), &(&1 >= 0 and &1 <= 255))
  end

  test "hsl/0" do
    [hue | sl] = hsl()
    assert hue >= 0 and hue <= 360
    assert Enum.all?(sl, &Regex.match?(~r/\A\d{1,3}%\z/, &1))
  end

  test "rgba/0" do
    [r, g, b, a] = rgba()
    assert r in 0..255
    assert g in 0..255
    assert b in 0..255
    assert a >= 0.0 and a <= 1.0
  end

  test "hsla/0" do
    [h, s, l, a] = hsla()
    assert h in 0..360
    assert_match ~r/\A\d{1,3}%\z/, s
    assert_match ~r/\A\d{1,3}%\z/, l
    assert a >= 0.0 and a <= 1.0, "#{a} is not in 0..1"
  end

  test "alpha/0" do
    a = alpha()
    assert a >= 0.0 and a <= 1.0, "#{a} is not in 0..1"
  end
end
