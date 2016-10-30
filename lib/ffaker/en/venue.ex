defmodule Ffaker.En.Venue do
  import Ffaker, only: [list_file: 2]
  @moduledoc """
  Functions for venue name
  """
  @colors ~w(female male unknown)
  @path "en/venue"

  @doc """
  Returns venue

  ## Examples

      iex> Ffaker.En.Venue.name
      "Business Planet"
  """
  @spec name() :: String.t
  def name do
    "names" |> list_file(@path) |> Enum.random
  end
end
