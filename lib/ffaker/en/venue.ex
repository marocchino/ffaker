defmodule Ffaker.En.Venue do
  @moduledoc """
  Functions for venue name
  """

  import Ffaker, only: [list_file: 2]

  @path "en/venue"
  @colors ~w(female male unknown)

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
