defmodule Ffaker.En.Unit do
  @moduledoc"""
  Functions for units in English
  """

  @time_units ~w(Years Days Hours Minutes Seconds Milliseconds)
  @temperature_units ~w(Kelvin Celsius Fahrenheit)

  @doc"""
  Returns time unit

  ## Examples

      iex> Ffaker.En.Unit.time_unit
      "Years"
  """
  @spec time_unit() :: String.t
  def time_unit do
    Enum.random(@time_units)
  end

  @doc"""
  Returns temperature unit

  ## Examples

      iex> Ffaker.En.Unit.temperature_unit
      "Kelvin"
  """
  @spec temperature_unit() :: String.t
  def temperature_unit do
    Enum.random(@temperature_units)
  end

  @doc"""
  Returns temperature abbr

  ## Examples

      iex> Ffaker.En.Unit.temperature_abbr
      "K"
  """
  @spec temperature_abbr() :: String.t
  def temperature_abbr do
    String.at(temperature_unit(), 0)
  end
end
