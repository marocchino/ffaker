defmodule Ffaker.En.ColorTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Color
  import Ffaker.Matcher, only: [assert_match: 2, assert_in_file: 3]
  @path "en/color"

  test "name/0" do
    assert_in_file(name, "names", @path)
  end

  test "hex_code/0" do
    assert_match ~r/\A[0-9A-F]{6}\z/, hex_code
  end

  test "rgb/0" do
    assert rgb |> Enum.all?(&(&1 >= 0 and &1 <= 255))
  end

  test "hsl/0" do
    [hue | sl] = hsl
    assert hue >= 0 and hue <= 360
    assert sl |> Enum.all?(&(Regex.match?(~r/\A\d{1,3}%\z/, &1)))
  end

  test "rgba/0" do
    assert rgba |> Enum.all?(&(&1 >= 0 and &1 <= 255))
    alpha = Enum.at(rgba, 3)
    assert alpha >= 0.0 and alpha <= 1.0
  end

  test "hsla/0" do
    hue = Enum.at(hsla, 0)
    saturation = Enum.at(hsla, 1)
    lightness = Enum.at(hsla, 2)
    alpha = Enum.at(hsla, 3)
    assert hue >= 0 and hue <= 360
    assert_match ~r/\A\d{1,3}%\z/, saturation
    assert_match ~r/\A\d{1,3}%\z/, lightness
    assert alpha >= 0.0 and alpha <= 1.0
  end

  test "alpha/0" do
    assert alpha >= 0.0 and alpha <= 1.0
  end
end
