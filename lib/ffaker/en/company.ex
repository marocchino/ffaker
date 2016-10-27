defmodule Ffaker.En.Company do
  import Ffaker
  alias Ffaker.En.Name
  @moduledoc """
  Functions for company data in English
  """
  @suffixes ~w(Inc LLC Group)
  @position_prefixes ~w(Executive Assistant General Associate)
  @positions ~w(President Manager Director Secretary Consultant)

  @doc """
  Returns company name

  ## Examples

      iex> Ffaker.En.Company.name
      "Carroll, Reinger and Fritsch "
  """
  @spec name() :: String.t
  def name do
    first = Name.last_name
    second = Name.last_name
    last = Name.last_name
    ["#{first} #{suffix}",
     "#{first}-#{second}",
     "#{first}, #{second} and #{last}"]
    |> Enum.random
  end

  @doc """
  Returns company suffix

  ## Examples

      iex> Ffaker.En.Company.suffix
      "Inc"
  """
  @spec suffix() :: String.t
  def suffix do
    @suffixes
    |> Enum.random
  end

  @doc """
  Returns company catch phrase

  ## Examples

      iex> Ffaker.En.Company.catch_phrase
      "Secured homogeneous extranet"
  """
  @spec catch_phrase() :: String.t
  def catch_phrase do
    pre =
      "data/en/company/catch_pre"
      |> list_file
      |> Enum.random
    mid =
      "data/en/company/catch_mid"
      |> list_file
      |> Enum.random
    pos =
      "data/en/company/catch_pos"
      |> list_file
      |> Enum.random
    "#{pre} #{mid} #{pos}"
  end

  @doc """
  Returns company bs

  ## Examples

      iex> Ffaker.En.Company.bs
      "orchestrate transparent e-tailers"
  """
  @spec bs() :: String.t
  def bs do
    pre =
      "data/en/company/bs_pre"
      |> list_file
      |> Enum.random
    mid =
      "data/en/company/bs_mid"
      |> list_file
      |> Enum.random
    pos =
      "data/en/company/bs_pos"
      |> list_file
      |> Enum.random
    "#{pre} #{mid} #{pos}"
  end

  @doc """
  Returns company position

  ## Examples

      iex> Ffaker.En.Company.position
      "Inc"
  """
  @spec position() :: String.t
  def position do
    pos = @positions |> Enum.random
    prefix = @position_prefixes |> Enum.random
    ["#{position_area} #{pos}",
     "#{prefix} #{pos}",
     "#{prefix} #{position_area} #{pos}"]
    |> Enum.random
  end

  @doc """
  Returns company position area

  ## Examples

      iex> Ffaker.En.Company.position_area
      "IT"
  """
  @spec position_area() :: String.t
  def position_area do
    "data/en/company/position_areas"
    |> list_file
    |> Enum.random
  end
end
