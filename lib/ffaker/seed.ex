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
    Keyword.get(ExUnit.configuration, :seed) || elem(:os.timestamp, 2)
  end

  @doc """
  Reset seed

  ## Examples

      iex> s = Ffaker.Seed.next
      957639
      iex> Ffaker.Seed.next(s)
      957640
      iex> Ffaker.Seed.next(s)
      957641
  """
  def reset do
    s = seed
    :rand.seed(:exs1024, {s, s, s})
  end
end
