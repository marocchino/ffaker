defmodule Ffaker.En.Airline do
  @moduledoc"""
  Functions for Airline data in English
  """

  use Ffaker

  @doc"""
  Returns airline company name

  ## Examples

      iex> Ffaker.EnUs.Airline.name
      "Air France"
  """
  @spec name() :: String.t
  def name do
    Enum.random(~F(names))
  end

  @doc"""
  Returns flight number

  ## Examples

      iex> Ffaker.EnUs.Airline.flight_number
      "AF 303"
  """
  @spec flight_number() :: String.t
  def flight_number do
    code = Enum.random(~F(codes))
    num = Enum.random(1..3999)
    "#{code} #{num}"
  end

end
