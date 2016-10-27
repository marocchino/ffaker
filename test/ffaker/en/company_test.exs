defmodule Ffaker.En.CompanyTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Company
  import Ffaker, only: [list_file: 2]
  import Ffaker.Matcher, only: [assert_match: 2]
  @path "en/company"

  test "name/0" do
    assert_match ~r/\A[\w', -]+\z/, name
  end

  test "suffix/0" do
    assert suffix in ~w(Inc LLC Group)
  end

  test "catch_phrase/0" do
    assert_match ~r/\A(?:[\w\/ -]+ ){2}[\w-]+\z/, catch_phrase
  end

  test "bs/0" do
    assert_match ~r/\A(?:[\w \/-]+ ){2}[\w-]+\z/, bs
  end

  test "position/0" do
    assert_match ~r/\A(?:\w+ ){1,2}\w+\z/, position
  end

  test "position_area/0" do
    position_areas = list_file("position_areas", @path)
    assert position_area in position_areas
  end
end
