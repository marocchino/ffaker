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
    case random(0..2) do
       0 -> "#{Name.last_name} #{suffix}"
       1 -> "#{Name.last_name}-#{Name.last_name}"
       _ -> "#{Name.last_name}, #{Name.last_name} and #{Name.last_name}"
    end
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
    |> random
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
      |> random
    mid =
      "data/en/company/catch_mid"
      |> list_file
      |> random
    pos =
      "data/en/company/catch_pos"
      |> list_file
      |> random
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
      |> random
    mid =
      "data/en/company/bs_mid"
      |> list_file
      |> random
    pos =
      "data/en/company/bs_pos"
      |> list_file
      |> random
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
    pos = random(@positions)
    case random(0..2) do
       0 -> "#{position_area} #{pos}"
       1 -> "#{random(@position_prefixes)} #{pos}"
       _ -> "#{random(@position_prefixes)} #{position_area} #{pos}"
    end
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
    |> random
  end
end
