defmodule Ffaker.JaJp.Name do
  @moduledoc"""
  名前データを返す関数
  """

  use Ffaker

  @doc"""
  フルネームを返す

  ## Examples

      iex> Ffaker.JaJp.Name.name
      "葛西零"
  """
  @spec name() :: String.t
  def name do
    "#{last_name()}#{first_name()}"
  end

  @doc"""
  下の名を返す

  ## Examples

      iex> Ffaker.JaJp.Name.first_name
      "茜"
  """
  @spec first_name() :: String.t
  def first_name do
    Enum.random([female_first_name(), male_first_name()])
  end

  @doc"""
  男性の下の名を返す

  ## Examples

      iex> Ffaker.JaJp.Name.male_first_name
      "晃"
  """
  @spec male_first_name() :: String.t
  def male_first_name do
    Enum.random(~F(male_first_names))
  end

  @doc"""
  女性の下の名を返す

  ## Examples

      iex> Ffaker.JaJp.Name.female_first_name
      "茜"
  """
  @spec female_first_name() :: String.t
  def female_first_name do
    Enum.random(~F(female_first_names))
  end

  @doc"""
  苗字を返す

  ## Examples

      iex> Ffaker.JaJp.Name.last_name
      "田中"
  """
  @spec last_name() :: String.t
  def last_name do
    Enum.random(~F(last_names))
  end
end
