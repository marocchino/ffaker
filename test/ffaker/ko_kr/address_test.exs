defmodule Ffaker.KoKr.AddressTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.KoKr.Address
  import Ffaker.Matcher, only: [assert_match: 2]

  @metropolitan_cities ~w(서울특별시 부산광역시 대구광역시 인천광역시
                          광주광역시 대전광역시 울산광역시 세종특별자치시)
  @provinces ~w(경기도 강원도 충청북도 충청남도 전라북도 전라남도 경상북도
                경상남도 제주특별자치도)

  test "postal_code/0" do
    assert_match ~r(\A\d{5}\z), postal_code()
  end

  test "old_postal_code/0" do
    assert_match ~r(\A\d{3}-\d{3}\z), old_postal_code()
  end

  test "road_address/0" do
    assert_match ~r/\A.+\z/, road_address()
  end

  test "land_address/0" do
    assert_match ~r/\A.+\z/, land_address()
  end

  test "land_number/0" do
    assert_match ~r/\A\d{3,4}(?:-\d{1,2})?\z/, land_number()
  end

  test "building_name/0" do
    assert_match ~r/\A.+(?:빌라|아파트|연립|마을|타운|타워)\z/,
                 building_name()
  end

  test "address_detail/0" do
    assert_match ~r/\A.+(?:빌라|아파트|연립|마을|타운|타워).*\z/,
                 address_detail()
  end

  test "street/0" do
    assert_match ~r/\A.+(?:로|가|거리|길)\z/, street()
  end

  test "town/0" do
    assert_match ~r/\A.+(?:동|리|마을)\z/, town()
  end

  test "borough/0" do
    assert borough() in ~F(boroughs)
  end

  test "city/0" do
    assert city() in ~F(cities)
  end

  test "province" do
    assert province() in @provinces
  end

  test "metropolitan_city/0" do
    assert metropolitan_city() in @metropolitan_cities
  end
end
