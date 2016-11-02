defmodule Ffaker.KoKr.PhoneNumer do
  import Ffaker, only: [numerify: 1]
  @moduledoc """
  한국 전화번호 데이터에 관련된 함수가 들어있는 모듈
  """
  @home_phone_prefixes ~w(02 031 032 033 041 042 043 044 049
                          051 052 053 054 055 061 062 063 064)
  @mobile_phone_prefixes ~w(010 011 016 019)

  @doc """
  전화 번호를 반환

  ## 예제

      iex> Ffaker.KoKr.PhoneNumer.phone_number
      "010-1234-5678"
  """
  def phone_number do
    [home_phone_number, mobile_phone_number] |> Enum.random
  end

  @doc """
  자택, 직장 전화 번호를 반환

  ## Examples

      iex> Ffaker.KoKr.PhoneNumer.home_phone_number
      "02-1234-5678"
  """
  def home_phone_number do
    home_phone_prefix = @home_phone_prefixes |> Enum.random
    numerify("#{home_phone_prefix}-####-####")
  end

  @doc """
  휴대 전화 번호를 반환

  ## Examples

      iex> Ffaker.KoKr.PhoneNumer.mobile_phone_number
      "010-1234-5678"
  """
  def mobile_phone_number do
    mobile_phone_prefix = @mobile_phone_prefixes |> Enum.random
    numerify("#{mobile_phone_prefix}-####-####")
  end

  @doc """
  국제 전화 번호를 반환

  ## 예제

      iex> Ffaker.KoKr.PhoneNumer.international_phone_number
      "+81 10-1234-5678"
  """
  def international_phone_number do
    phone_number |> international
  end

  @doc """
  국제 자택 전화 번호를 반환

  ## 예제

      iex> Ffaker.KoKr.PhoneNumer.international_home_phone_number
      "+81 10-1234-5678"
  """
  def international_home_phone_number do
    home_phone_number |> international
  end

  @doc """
  국제 휴대 전화 번호를 반환

  ## 예제

      iex> Ffaker.KoKr.PhoneNumer.international_mobile_phone_number
      "+81 10-1234-5678"
  """
  def international_mobile_phone_number do
    mobile_phone_number |> international
  end

  defp international("0" <> rest) do
    "+81 " <> rest
  end
end
