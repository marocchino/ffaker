defmodule Ffaker.Boolean do
  @moduledoc"""
  Functions for boolean
  """

  @doc"""
  Returns true or false

  ## Examples

      iex> Ffaker.Boolean.maybe
      true
  """
  @spec maybe() :: true | false
  def maybe do
    Enum.random([true, false])
  end
end
