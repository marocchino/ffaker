defmodule Ffaker.KoKr.PhoneNumer do
  @moduledoc"""
  한국 전화번호 데이터에 관련된 함수가 들어있는 모듈
  """

  import Ffaker, only: [numerify: 1]

  @home_phone_prefixes ~w(02 031 032 033 041 042 043 044 049
                          051 052 053 054 055 061 062 063 064)
  @mobile_phone_prefixes ~w(010 011 016 019)

  @doc"""
  전화 번호를 반환

  ## 예제

      iex> Ffaker.KoKr.PhoneNumer.phone_number
      "010-1234-5678"
  """
  @spec phone_number() :: String.t
  def phone_number do
    Enum.random([home_phone_number(), mobile_phone_number()])
  end

  @doc"""
  자택, 직장 전화 번호를 반환

  ## Examples

      iex> Ffaker.KoKr.PhoneNumer.home_phone_number
      "02-1234-5678"
  """
  @spec home_phone_number() :: String.t
  def home_phone_number do
    home_phone_prefix = Enum.random(@home_phone_prefixes)
    numerify("#{home_phone_prefix}-####-####")
  end

  @doc"""
  휴대 전화 번호를 반환

  ## Examples

      iex> Ffaker.KoKr.PhoneNumer.mobile_phone_number
      "010-1234-5678"
  """
  @spec mobile_phone_number() :: String.t
  def mobile_phone_number do
    mobile_phone_prefix = Enum.random(@mobile_phone_prefixes)
    numerify("#{mobile_phone_prefix}-####-####")
  end

  @doc"""
  국제 전화 번호를 반환

  ## 예제

      iex> Ffaker.KoKr.PhoneNumer.international_phone_number
      "+81 10-1234-5678"
  """
  @spec international_phone_number() :: String.t
  def international_phone_number do
    international(phone_number())
  end

  @doc"""
  국제 자택 전화 번호를 반환

  ## 예제

      iex> Ffaker.KoKr.PhoneNumer.international_home_phone_number
      "+81 10-1234-5678"
  """
  @spec international_home_phone_number() :: String.t
  def international_home_phone_number do
    international(home_phone_number())
  end

  @doc"""
  국제 휴대 전화 번호를 반환

  ## 예제

      iex> Ffaker.KoKr.PhoneNumer.international_mobile_phone_number
      "+81 10-1234-5678"
  """
  @spec international_mobile_phone_number() :: String.t
  def international_mobile_phone_number do
    international(mobile_phone_number())
  end

  @spec international(String.t) :: String.t
  defp international("0" <> rest) do
    "+81 " <> rest
  end
end
