defmodule Ffaker.EnUs.Address do
  import Ffaker, only: [list_file: 2, numerify: 1]
  alias Ffaker.En.Name
  @moduledoc """
  Functions for US Address data in English
  """

  @path "en_us/address"
  @city_prefixes ~w(North East West South New Lake Port)
  @sec_addrs [" Apt. ###", " Suite ###", ""]

  @doc """
  Returns zip_code

  ## Examples

      iex> Ffaker.EnUs.Address.zip_code
      "12345"
  """
  @spec zip_code() :: String.t
  def zip_code do
    ~w(##### #####-####) |> Enum.random |> numerify
  end

  @doc """
  Returns city

  ## Examples

      iex> Ffaker.EnUs.Address.city
      "New alicetown"
  """
  @spec city() :: String.t
  def city do
    city_prefix = @city_prefixes |> Enum.random
    city_suffix = "city_suffixes" |> list_file(@path) |> Enum.random
    first_name = Name.first_name
    ["#{first_name}#{city_suffix}",
     "#{city_prefix} #{first_name}",
     "#{city_prefix} #{first_name}#{city_suffix}"]
    |> Enum.random
  end

  @doc """
  Returns neighborhood

  ## Examples

      iex> Ffaker.EnUs.Address.neighborhood
      "Candlewood Country Club"
  """
  @spec neighborhood() :: String.t
  def neighborhood do
    "neighborhoods" |> list_file(@path) |> Enum.random
  end

  @doc """
  Returns street

  ## Examples

      iex> Ffaker.EnUs.Address.street
      "Hawaii"
  """
  @spec street() :: String.t
  def street do
    building_number = ~w(### #### ##### ######) |> Enum.random |> numerify
    sec_addr = @sec_addrs |> Enum.random |> numerify
    street_suffix =
      "street_suffixes"
      |> list_file(@path)
      |> Enum.random
    "#{building_number} #{Name.first_name} #{street_suffix}#{sec_addr}"
  end

  @doc """
  Returns states

  ## Examples

      iex> Ffaker.EnUs.Address.state
      "Hawaii"
  """
  @spec state() :: String.t
  def state do
    "states" |> list_file(@path) |> Enum.random
  end

  @doc """
  Returns state_abbr

  ## Examples

      iex> Ffaker.EnUs.Address.state_abbr
      "HI"
  """
  @spec state_abbr() :: String.t
  def state_abbr do
    "states_abbrs" |> list_file(@path) |> Enum.random
  end

  @doc """
  Returns state_and_territory_abbr

  ## Examples

      iex> Ffaker.EnUs.Address.state_and_territory_abbr
      "MS"
  """
  @spec state_and_territory_abbr() :: String.t
  def state_and_territory_abbr do
    "states_and_territories_abbrs" |> list_file(@path) |> Enum.random
  end

  @doc """
  Returns state except Hawaii and Alaska

  ## Examples

      iex> Ffaker.EnUs.Address.continental_state
      "Arizona"
  """
  @spec continental_state() :: String.t
  def continental_state do
    s = state
    case s in ~w(Hawaii Alaska) do
       true -> continental_state
       false -> s
    end
  end

  @doc """
  Returns state abbr except HI and AK

  ## Examples

      iex> Ffaker.EnUs.Address.continental_state_abbr
      "AN"
  """
  @spec continental_state_abbr() :: String.t
  def continental_state_abbr do
    s = state_abbr
    case s in ~w(HI AK) do
       true -> continental_state_abbr
       false -> s
    end
  end
end
