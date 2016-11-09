defmodule Ffaker.KoKr.Name do
  @moduledoc"""
  이름 데이터에 관한 함수가 들어있는 모듈
  """

  use Ffaker

  @doc"""
  공백이 들어간 전체 이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Name.name
      "김 희선"
  """
  @spec name_with_space() :: String.t
  def name_with_space do
    "#{last_name()} #{first_name()}"
  end

  @doc"""
  전체 이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Name.name
      "김희선"
  """
  @spec name() :: String.t
  def name do
    "#{last_name()}#{first_name()}"
  end

  @doc"""
  이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Name.first_name
      "희선"
  """
  @spec first_name() :: String.t
  def first_name do
    Enum.random([female_first_name(), male_first_name()])
  end

  @doc"""
  남자 이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Name.male_first_name
      "상용"
  """
  @spec male_first_name() :: String.t
  def male_first_name do
    Enum.random(~F(male_first_names))
  end

  @doc"""
  여자 이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Name.female_first_name
      "희선"
  """
  @spec female_first_name() :: String.t
  def female_first_name do
    Enum.random(~F(female_first_names))
  end

  @doc"""
  성씨를 반환

  ## Examples

      iex> Ffaker.KoKr.Name.last_name
      "김"
  """
  @spec last_name() :: String.t
  def last_name do
    Enum.random(~F(last_names))
  end
end
