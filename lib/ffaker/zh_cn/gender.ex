defmodule Ffaker.ZhCn.Gender do
  @moduledoc"""
  Functions for gender data in Chinese
  """

  @genders ~w(女 男)

  @doc"""
  Returns gender

  ## Examples

      iex> Ffaker.ZhCn.Gender.gender
      "女"
  """
  @spec gender() :: String.t
  def gender do
    Enum.random(@genders)
  end
end
