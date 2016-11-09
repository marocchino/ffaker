defmodule Ffaker.En.Venue do
  @moduledoc"""
  Functions for venue name
  """

  use Ffaker

  @colors ~w(female male unknown)

  @doc"""
  Returns venue

  ## Examples

      iex> Ffaker.En.Venue.name
      "Business Planet"
  """
  @spec name() :: String.t
  def name do
    Enum.random(~F(names))
  end
end
