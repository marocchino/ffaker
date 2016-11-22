defmodule Ffaker.JaJp.Job do
  @moduledoc"""
  日本語職業データを返す関数
  """

  use Ffaker

  @doc"""
  職業を返す

  ## Examples

      iex> Ffaker.JaJp.Job.title
      "プログラマー"
  """
  @spec title() :: String.t
  def title do
    Enum.random(~F(titles))
  end
end
