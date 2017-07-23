defmodule Ffaker.ZhCn.Name do
  @moduledoc"""
  中文姓氏
  """

  use Ffaker

  @doc"""
  中文名

  ### Example

      iex> Ffaker.ZhCn.Name.name
      "典然须"
  """
  @spec name() :: String.t
  def name do
    "#{first_name()}#{last_name()}"
  end

  @doc"""
  名

  ### Example

      iex> Ffaker.ZhCn.Name.first_name
      "修纯"
  """
  @spec first_name() :: String.t
  def first_name do
    Enum.random(~F(first_names))
  end

  @doc"""
  姓

  ### Example

      iex> Ffaker.ZhCn.Name.last_name
      "曾"
  """
  @spec last_name() :: String.t
  def last_name do
    Enum.random(~F(last_names))
  end
end
