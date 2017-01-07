defmodule Ffaker.Seed do
  @moduledoc"""
  Manage seed
  """

  @doc"""
  Init seed

  ## Examples

      iex> Ffaker.Seed.seed
      0
  """
  @spec seed() :: number
  def seed do
    Keyword.get(ExUnit.configuration, :seed) || elem(:os.timestamp, 2)
  end

  @doc"""
  Reset seed

  ## Examples

      iex> s = Ffaker.Seed.reset
      iex> Enum.Random(1..10)
      5
      iex> Enum.Random(1..10)
      7
      iex> s = Ffaker.Seed.reset
      iex> Enum.Random(1..10)
      5
      iex> Enum.Random(1..10)
      7
  """
  @spec reset() :: :rand.state()
  def reset do
    s = seed()
    :rand.seed(:exs1024, {s, s, s})
  end
end
