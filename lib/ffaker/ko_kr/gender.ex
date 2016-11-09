defmodule Ffaker.KoKr.Gender do
  @moduledoc"""
  성별 데이터에 관함 함수가 들어있는 모듈
  """

  @genders ~w(남 여)

  @doc"""
  성별을 반환

  ## Examples
      iex> Ffaker.KoKr.Gender.gender
      "여"
  """
  @spec gender() :: String.t
  def gender do
    Enum.random(@genders)
  end
end
