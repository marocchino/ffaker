defmodule Ffaker.Seed do
  @moduledoc """
  manage seed
  """
  @doc """
  init seed

  ## Examples

      iex> Ffaker.Seed.seed
      0
  """
  @spec seed() :: number
  def seed do
    Keyword.get(ExUnit.configuration, :ffaker_seed) ||
      Keyword.get(ExUnit.configuration, :seed) ||
      elem(:os.timestamp, 2)
  end

  @doc """
  Returns next seed

  ## Examples

      iex> s = Ffaker.Seed.next
      957639
      iex> Ffaker.Seed.next(s)
      957640
      iex> Ffaker.Seed.next(s)
      957641
  """
  @spec next() :: number
  def next do
    s = seed + 1
    :rand.seed(:exsplus, { s, s, s })
    ExUnit.configure ffaker_seed: s
  end

  @doc """
  Returns next seed

  ## Examples

      iex> s = Ffaker.Seed.next
      957639
      iex> Ffaker.Seed.next(s)
      957640
      iex> Ffaker.Seed.next(s)
      957641
  """
  @spec next() :: number
  def reset do
    ExUnit.configure ffaker_seed: Keyword.get(ExUnit.configuration, :seed)
  end
end
