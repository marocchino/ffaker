defmodule Ffaker.En.ColorTest do
  use ExUnit.Case, async: true
  import Ffaker, only: [list_file: 1]
  import Ffaker.En.Color

  test "name/0" do
    names = list_file("data/en/color/names")
    assert name in names
  end

  test "hex_code/0" do
    actual = hex_code
    assert Regex.match?(~r/\A[0-9A-F]{6}\z/, actual), "#{actual} is not matched"
  end

  test "rgb/0" do
    assert rgb
           |> Enum.all?(&(&1 >= 0 and &1 <= 255))
  end

  test "hsl/0" do
    [hue | sl]= hsl
    assert hue >= 0 and hue <= 360
    assert sl
           |> Enum.all?(&(Regex.match?(~r/\A\d{1,3}%\z/, &1)))
  end

  test "rgba/0" do
    assert rgba
           |> Enum.all?(&(&1 >= 0 and &1 <= 255))
    alpha = Enum.at(rgba, 3)
    assert alpha >= 0.0 and alpha <= 1.0
  end

  test "hsla/0" do
    hue = Enum.at(hsla, 0)
    saturation = Enum.at(hsla, 1)
    lightness = Enum.at(hsla, 2)
    alpha = Enum.at(hsla, 3)
    assert hue >= 0 and hue <= 360
    assert Regex.match?(~r/\A\d{1,3}%\z/, saturation),
           "#{saturation} is not matched"
    assert Regex.match?(~r/\A\d{1,3}%\z/, lightness),
           "#{saturation} is not matched"
    assert alpha >= 0.0 and alpha <= 1.0
  end

  test "alpha/0" do
    assert alpha >= 0.0 and alpha <= 1.0
  end
end
