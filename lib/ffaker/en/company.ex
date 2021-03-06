defmodule Ffaker.En.Company do
  @moduledoc"""
  Functions for company data in English
  """

  use Ffaker
  alias Ffaker.En.Name
  @suffixes ~w(Inc LLC Group)
  @position_prefixes ~w(Executive Assistant General Associate)
  @positions ~w(President Manager Director Secretary Consultant)

  @doc"""
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
    ["#{first} #{suffix()}",
     "#{first}-#{second}",
     "#{first}, #{second} and #{last}"]
    |> Enum.random
  end

  @doc"""
  Returns company suffix

  ## Examples

      iex> Ffaker.En.Company.suffix
      "Inc"
  """
  @spec suffix() :: String.t
  def suffix do
    Enum.random(@suffixes)
  end

  @doc"""
  Returns company catch phrase

  ## Examples

      iex> Ffaker.En.Company.catch_phrase
      "Secured homogeneous extranet"
  """
  @spec catch_phrase() :: String.t
  def catch_phrase do
    [~F(catch_pre), ~F(catch_mid), ~F(catch_pos)]
    |> Enum.map(&Enum.random/1)
    |> Enum.join(" ")
  end

  @doc"""
  Returns company bs

  ## Examples

      iex> Ffaker.En.Company.bs
      "orchestrate transparent e-tailers"
  """
  @spec bs() :: String.t
  def bs do
    [~F(bs_pre), ~F(bs_mid), ~F(bs_pos)]
    |> Enum.map(&Enum.random/1)
    |> Enum.join(" ")
  end

  @doc"""
  Returns company position

  ## Examples

      iex> Ffaker.En.Company.position
      "Inc"
  """
  @spec position() :: String.t
  def position do
    pos = Enum.random(@positions)
    prefix = Enum.random(@position_prefixes)
    ["#{position_area()} #{pos}",
     "#{prefix} #{pos}",
     "#{prefix} #{position_area()} #{pos}"]
    |> Enum.random
  end

  @doc"""
  Returns company position area

  ## Examples

      iex> Ffaker.En.Company.position_area
      "IT"
  """
  @spec position_area() :: String.t
  def position_area do
    Enum.random(~F(position_areas))
  end
end
