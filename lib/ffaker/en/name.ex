defmodule Ffaker.En.Name do
  import Ffaker
  @moduledoc """
  Functions for name data in English
  """

  @doc """
  Returns name
  """
  @spec name() :: String.t
  def name do
    "#{first_name} #{last_name}"
  end

  @doc """
  Returns first name
  """
  @spec first_name() :: String.t
  def first_name do
    case random(0..1) do
      1 -> first_name_female
      _ -> first_name_male
    end
  end

  @doc """
  Returns male first name
  """
  @spec first_name_male() :: String.t
  def first_name_male do
    list_file("data/en/name/first_names_male")
    |> random
  end

  @doc """
  Returns female first name
  """
  @spec first_name_female() :: String.t
  def first_name_female do
    list_file("data/en/name/first_names_female")
    |> random
  end

  @doc """
  Returns last name
  """
  @spec last_name() :: String.t
  def last_name do
    list_file("data/en/name/last_names")
    |> random
  end

end
