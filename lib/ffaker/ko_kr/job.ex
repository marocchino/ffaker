defmodule Ffaker.KoKr.Job do
  @moduledoc"""
  직업 데이터에 관한 함수가 들어있는 모듈
  """

  use Ffaker

  @doc"""
  직업명을 반환

  ## Examples

      iex> Ffaker.KoKr.Job.title
      "프로그레머"
  """
  @spec title() :: String.t
  def title do
    Enum.random(~F(titles))
  end
end
