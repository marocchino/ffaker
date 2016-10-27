defmodule Ffaker.EnUs.Address do
  import Ffaker, only: [list_file: 1, numerify: 1]
  alias Ffaker.En.Name
  @moduledoc """
  Functions for US Address data in English
  """

  @city_prefixes ~w(North East West South New Lake Port)
  @sec_addrs [" Apt. ###", " Suite ###", ""]

  @doc """
  Returns zip_code

  ## Examples

      iex> Ffaker.EnUs.Address.zip_code
      "12345"
  """
  def zip_code do
    ~w(##### #####-####) |> Enum.random |> numerify
  end

  @doc """
  Returns city

  ## Examples

      iex> Ffaker.EnUs.Address.city
      "New alicetown"
  """
  def city do
    city_prefix = @city_prefixes |> Enum.random
    city_suffix = "data/en_us/address/city_suffixes" |> list_file |> Enum.random
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
  def neighborhood do
    "data/en_us/address/neighborhoods" |> list_file |> Enum.random
  end

  @doc """
  Returns street

  ## Examples

      iex> Ffaker.EnUs.Address.street
      "Hawaii"
  """
  def street do
    building_number = ~w(### #### ##### ######) |> Enum.random |> numerify
    sec_addr = @sec_addrs |> Enum.random |> numerify
    street_suffix =
      "data/en_us/address/street_suffixes"
      |> list_file
      |> Enum.random
    "#{building_number} #{Name.first_name} #{street_suffix}#{sec_addr}"
  end

  @doc """
  Returns states

  ## Examples

      iex> Ffaker.EnUs.Address.state
      "Hawaii"
  """
  def state do
    "data/en_us/address/states" |> list_file |> Enum.random
  end

  @doc """
  Returns state_abbr

  ## Examples

      iex> Ffaker.EnUs.Address.state_abbr
      "HI"
  """
  def state_abbr do
    "data/en_us/address/states_abbrs" |> list_file |> Enum.random
  end

  @doc """
  Returns state_and_territory_abbr

  ## Examples

      iex> Ffaker.EnUs.Address.state_and_territory_abbr
      "MS"
  """
  def state_and_territory_abbr do
    "data/en_us/address/states_and_territories_abbrs"
    |> list_file
    |> Enum.random
  end

  @doc """
  Returns state except Hawaii and Alaska

  ## Examples

      iex> Ffaker.EnUs.Address.continental_state
      "Arizona"
  """
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
  def continental_state_abbr do
    s = state_abbr
    case s in ~w(HI AK) do
       true -> continental_state_abbr
       false -> s
    end
  end
end
