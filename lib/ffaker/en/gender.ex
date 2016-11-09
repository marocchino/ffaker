defmodule Ffaker.En.Gender do
  @moduledoc"""
  Functions for gender data in English
  """

  @genders ~w(female male unknown)

  @doc"""
  Returns gender

  ## Examples

      iex> Ffaker.En.Gender.gender
      "female"
  """
  @spec gender() :: String.t
  def gender do
    Enum.random(@genders)
  end

  @doc"""
  Returns true if gender is female

  ## Examples

      iex> Ffaker.En.Gender.female?
      true
  """
  @spec female?() :: boolean
  def female? do
    gender() == "female"
  end

  @doc"""
  Returns true if gender is male

  ## Examples

      iex> Ffaker.En.Gender.male?
      false
  """
  @spec male?() :: boolean
  def male? do
    gender() == "male"
  end

  @doc"""
  Returns true if gender is unknown

  ## Examples

      iex> Ffaker.En.Gender.unknown?
      false
  """
  @spec unknown?() :: boolean
  def unknown? do
    gender() == "unknown"
  end
end
