defmodule Ffaker.En.Unit do
  @moduledoc """
  Functions for units in English
  """
  @time_units ~w(Years Days Hours Minutes Seconds Milliseconds)
  @temperature_units ~w(Kelvin Celsius Fahrenheit)

  @doc """
  Returns time_unit

  ## Examples

      iex> Ffaker.En.Unit.time_unit
      "Years"
  """
  def time_unit do
    @time_units |> Enum.random
  end

  @doc """
  Returns temperature_unit

  ## Examples

      iex> Ffaker.En.Unit.temperature_unit
      "Kelvin"
  """
  def temperature_unit do
    @temperature_units |> Enum.random
  end

  @doc """
  Returns temperature_abbr

  ## Examples

      iex> Ffaker.En.Unit.temperature_abbr
      "K"
  """
  def temperature_abbr do
    temperature_unit |> String.at(0)
  end
end
