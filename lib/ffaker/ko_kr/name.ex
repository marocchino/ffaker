defmodule Ffaker.KoKr.Name do
  import Ffaker, only: [list_file: 2]
  @moduledoc """
  이름 데이터에 관한 함수가 들어있는 모듈
  """
  @path "ko_kr/name"

  @doc """
  공백이 들어간 전체 이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Name.name
      "김 희선"
  """
  @spec name_with_space() :: String.t
  def name_with_space do
    "#{last_name} #{first_name}"
  end

  @doc """
  전체 이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Name.name
      "김희선"
  """
  @spec name() :: String.t
  def name do
    "#{last_name}#{first_name}"
  end

  @doc """
  이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Name.first_name
      "희선"
  """
  @spec first_name() :: String.t
  def first_name do
    [female_first_name, male_first_name] |> Enum.random
  end

  @doc """
  남자 이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Name.male_first_name
      "상용"
  """
  @spec male_first_name() :: String.t
  def male_first_name do
    "male_first_names" |> list_file(@path) |> Enum.random
  end

  @doc """
  여자 이름을 반환

  ## Examples

      iex> Ffaker.KoKr.Name.female_first_name
      "희선"
  """
  @spec female_first_name() :: String.t
  def female_first_name do
    "female_first_names" |> list_file(@path) |> Enum.random
  end

  @doc """
  성씨를 반환

  ## Examples

      iex> Ffaker.KoKr.Name.last_name
      "김"
  """
  @spec last_name() :: String.t
  def last_name do
    "last_names" |> list_file(@path) |> Enum.random
  end
end
