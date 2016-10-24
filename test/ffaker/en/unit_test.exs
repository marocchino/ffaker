defmodule Ffaker.En.UnitTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Unit
  @time_units ~w(Years Days Hours Minutes Seconds Milliseconds)
  @temperature_units ~w(Kelvin Celsius Fahrenheit)

  test "time_unit/0" do
    assert time_unit in @time_units
  end

  test "temperature_unit/0" do
    assert temperature_unit in @temperature_units
  end

  test "temperature_abbr/0" do
    assert temperature_abbr in ~w(K C F)
  end
end
