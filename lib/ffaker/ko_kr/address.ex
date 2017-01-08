defmodule Ffaker.KoKr.Address do
  @moduledoc"""
  주소 데이터에 관한 함수가 들어있는 모듈
  """

  use Ffaker
  alias Ffaker.KoKr.Name
  import Ffaker, only: [numerify: 1]

  @building_dongs ~w(가 나 다 라 마 바 ## ###)
  @building_suffixes ~w(빌라 아파트 연립 마을 타운 타워)
  @street_suffixes ~w(로 #로 가 #가 거리 길)
  @town_suffixes ~w(동 리 마을)
  @metropolitan_cities ~w(서울특별시 부산광역시 대구광역시 인천광역시
                          광주광역시 대전광역시 울산광역시 세종특별자치시)
  @provinces ~w(경기도 강원도 충청북도 충청남도 전라북도 전라남도 경상북도
                경상남도 제주특별자치도)

  @doc"""
  도로명 주소의 우편번호를 반환

  ## Examples

      iex> Ffaker.KoKr.Address.postal_code
      "12345"
  """
  @spec postal_code() :: String.t
  def postal_code do
    numerify("#####")
  end

  @doc"""
  옛 주소의 우편번호를 반환

  ## Examples

      iex> Ffaker.KoKr.Address.old_postal_code
      "123-456"
  """
  @spec old_postal_code() :: String.t
  def old_postal_code do
    numerify("###-###")
  end

  @doc"""
  도로명 주소를 반환

  ## Examples

      iex> Ffaker.KoKr.Address.road_address
      "전라남도 수원시 영통구 병철5로"
  """
  @spec road_address() :: String.t
  def road_address do
    prefix =
      ["#{metropolitan_city()} #{borough()}", "#{province()} #{city()}"]
      |> Enum.random
    suffix = Enum.random([street(), "#{street()} (#{city()})"])
    "#{prefix} #{suffix}"
  end

  @doc"""
  옛 주소를 반환

  ## Examples

      iex> Ffaker.KoKr.Address.land_address
      "경상북도 안산시 단원구 예준마을 821-65"
  """
  @spec land_address() :: String.t
  def land_address do
    prefix =
      ["#{metropolitan_city()} #{borough()}", "#{province()} #{city()}"]
      |> Enum.random
    "#{prefix} #{town()} #{land_number()}"
  end

  @doc"""
  옛 주소의 지번을 반환

  ## Examples

      iex> Ffaker.KoKr.Address.land_number
      "1192-2"
  """
  @spec land_number() :: String.t
  def land_number do
    ~w(### ###-# ###-## #### ####-#) |> Enum.random |> numerify
  end

  @doc"""
  건물이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Address.building_name
      "대영빌딩"
  """
  @spec building_name() :: String.t
  def building_name do
    Name.first_name <> Enum.random(@building_suffixes)
  end

  @doc"""
  건물이름, 호수를 반환

  ## Examples

      iex> Ffaker.KoKr.Address.address_detail
      "대영빌딩 123호"
  """
  @spec address_detail() :: String.t
  def address_detail do
    dong = @building_dongs |> Enum.random |> numerify
    suffix = numerify("###호")
    name = building_name()
    Enum.random([name, name <> dong <> suffix, name <> suffix])
  end

  @doc"""
  도로명을 반환

  ## Examples

      iex> Ffaker.KoKr.Address.street
      "대영2로"
  """
  @spec street() :: String.t
  def street do
    suffix = @street_suffixes |> Enum.random |> numerify
    Name.first_name <> suffix
  end

  @doc"""
  동을 반환

  ## Examples

      iex> Ffaker.KoKr.Address.town
      "대영마을"
  """
  @spec town() :: String.t
  def town do
    Name.first_name <> Enum.random(@town_suffixes)
  end

  @doc"""
  구를 반환

  ## Examples

      iex> Ffaker.KoKr.Address.borough
      "종로구"
  """
  @spec borough() :: String.t
  def borough do
    Enum.random(~F(boroughs))
  end

  @doc"""
  시를 반환

  ## Examples

      iex> Ffaker.KoKr.Address.city
      "화성시"
  """
  @spec city() :: String.t
  def city do
    Enum.random(~F(cities))
  end

  @doc"""
  도를 반환

  ## Examples

      iex> Ffaker.KoKr.Address.province
      "경기도"
  """
  @spec province() :: String.t
  def province do
    Enum.random(@provinces)
  end

  @doc"""
  광역시를 반환

  ## Examples

      iex> Ffaker.KoKr.Address.metropolitan_city
      "서울특별시"
  """
  @spec metropolitan_city() :: String.t
  def metropolitan_city do
    Enum.random(@metropolitan_cities)
  end
end
