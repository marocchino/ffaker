defmodule Ffaker.En.CompanyTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.En.Company
  import Ffaker.Matcher, only: [assert_match: 2]

  test "name/0" do
    assert_match ~r/\A[\w', -]+\z/, name()
  end

  test "suffix/0" do
    assert suffix() in ~w(Inc LLC Group)
  end

  test "catch_phrase/0" do
    assert_match ~r/\A(?:[\w\/ -]+ ){2}[\w-]+\z/, catch_phrase()
  end

  test "bs/0" do
    assert_match ~r/\A(?:[\w \/-]+ ){2}[\w-]+\z/, bs()
  end

  test "position/0" do
    assert_match ~r/\A(?:\w+ ){1,2}\w+\z/, position()
  end

  test "position_area/0" do
    assert position_area() in ~F(position_areas)
  end
end
