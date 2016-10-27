defmodule Ffaker.En.CompanyTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Company
  import Ffaker, only: [list_file: 2]
  @path "en/company"

  test "name/0" do
    n = name
    assert Regex.match?(~r/\A[\w', -]+\z/, n), "#{n} is not matched"
  end

  test "suffix/0" do
    assert suffix in ~w(Inc LLC Group)
  end

  test "catch_phrase/0" do
    c = catch_phrase
    assert Regex.match?(~r/\A(?:[\w -]+ ){2}[\w-]+\z/, c), "#{c} is not matched"
  end

  test "bs/0" do
    b = bs
    assert Regex.match?(~r/\A(?:[\w \/-]+ ){2}[\w-]+\z/, b),
           "#{b} is not matched"
  end

  test "position/0" do
    p = position
    assert Regex.match?(~r/\A(?:\w+ ){1,2}\w+\z/, p), "#{p} is not matched"
  end

  test "position_area/0" do
    position_areas = list_file("position_areas", @path)
    assert position_area in position_areas
  end
end
