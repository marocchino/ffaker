defmodule Ffaker.En.Name do
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
    case Enum.random(0..1) do
      1 -> first_name_female
      _ -> first_name_male
    end
  end

  @doc """
  Returns male first name
  """
  @spec first_name_male() :: String.t
  def first_name_male do
    rand_file("data/en/name/first_names_male")
  end

  @doc """
  Returns female first name
  """
  @spec first_name_female() :: String.t
  def first_name_female do
    rand_file("data/en/name/first_names_female")
  end

  @doc """
  Returns last name
  """
  @spec last_name() :: String.t
  def last_name do
    rand_file("data/en/name/last_names")
  end

  @spec rand_file(String.t) :: String.t
  defp rand_file(file_name) do
    case File.read(file_name) do
      {:ok, res} ->
        res
        |> String.split("\n")
        |> Enum.random
      {:error, info} -> raise info
    end
  end
end
