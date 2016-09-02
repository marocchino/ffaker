defmodule Ffaker.En.Gender do
  import Ffaker
  @moduledoc """
  Functions for gender data in English
  """
  @genders ~w(female male unknown)

  @doc """
  Returns gender
  """
  @spec gender() :: String.t
  def gender do
    @genders
    |> random
  end

  @doc """
  Returns true if gender is female
  """
  @spec female?() :: boolean
  def female? do
    gender == "female"
  end

  @doc """
  Returns true if gender is male
  """
  @spec male?() :: boolean
  def male? do
    gender == "male"
  end

  @doc """
  Returns true if gender is unknown
  """
  @spec unknown?() :: boolean
  def unknown? do
    gender == "unknown"
  end
end
