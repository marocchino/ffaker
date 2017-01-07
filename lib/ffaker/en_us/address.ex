defmodule Ffaker.EnUs.Address do
  @moduledoc"""
  Functions for US Address data in English
  """

  use Ffaker
  import Ffaker, only: [numerify: 1]
  alias Ffaker.En.Name

  @city_prefixes ~w(North East West South New Lake Port)
  @sec_addrs [" Apt. ###", " Suite ###", ""]

  @doc"""
  Returns zip code

  ## Examples

      iex> Ffaker.EnUs.Address.zip_code
      "12345"
  """
  @spec zip_code() :: String.t
  def zip_code do
    ~w(##### #####-####) |> Enum.random |> numerify
  end

  @doc"""
  Returns city

  ## Examples

      iex> Ffaker.EnUs.Address.city
      "New alicetown"
  """
  @spec city() :: String.t
  def city do
    city_prefix = @city_prefixes |> Enum.random
    city_suffix = Enum.random(~F(city_suffixes))
    first_name = Name.first_name
    ["#{first_name}#{city_suffix}",
     "#{city_prefix} #{first_name}",
     "#{city_prefix} #{first_name}#{city_suffix}"]
    |> Enum.random
  end

  @doc"""
  Returns neighborhood

  ## Examples

      iex> Ffaker.EnUs.Address.neighborhood
      "Candlewood Country Club"
  """
  @spec neighborhood() :: String.t
  def neighborhood do
    Enum.random(~F(neighborhoods))
  end

  @doc"""
  Returns street

  ## Examples

      iex> Ffaker.EnUs.Address.street
      "Hawaii"
  """
  @spec street() :: String.t
  def street do
    building_number = ~w(### #### ##### ######) |> Enum.random |> numerify
    sec_addr = @sec_addrs |> Enum.random |> numerify
    street_suffix = Enum.random(~F(street_suffixes))
    "#{building_number} #{Name.first_name} #{street_suffix}#{sec_addr}"
  end

  @doc"""
  Returns states

  ## Examples

      iex> Ffaker.EnUs.Address.state
      "Hawaii"
  """
  @spec state() :: String.t
  def state do
    Enum.random(~F(states))
  end

  @doc"""
  Returns state abbr

  ## Examples

      iex> Ffaker.EnUs.Address.state_abbr
      "HI"
  """
  @spec state_abbr() :: String.t
  def state_abbr do
    Enum.random(~F(states_abbrs))
  end

  @doc"""
  Returns state and territory abbr

  ## Examples

      iex> Ffaker.EnUs.Address.state_and_territory_abbr
      "MS"
  """
  @spec state_and_territory_abbr() :: String.t
  def state_and_territory_abbr do
    Enum.random(~F(states_and_territories_abbrs))
  end

  @doc"""
  Returns state except Hawaii and Alaska

  ## Examples

      iex> Ffaker.EnUs.Address.continental_state
      "Arizona"
  """
  @spec continental_state() :: String.t
  def continental_state do
    ~F(states)
    |> Enum.filter(fn s -> not s in ~w(Hawaii Alaska) end)
    |> Enum.random
  end

  @doc"""
  Returns state abbr except Hawaii and Alaska

  ## Examples

      iex> Ffaker.EnUs.Address.continental_state_abbr
      "AN"
  """
  @spec continental_state_abbr() :: String.t
  def continental_state_abbr do
    ~F(states_abbrs)
    |> Enum.filter(fn s -> not s in ~w(HI AK) end)
    |> Enum.random
  end
end
