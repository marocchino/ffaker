defmodule Ffaker.KoKr.Lorem do
  @moduledoc """
  에국가를 베이스로한 로렘 데이터에 관한 함수가 들어있는 모듈
  """

  import Ffaker, only: [list_file: 2]

  @path "ko_kr/lorem"

  @doc """
  단어를 반환

  ## Examples

      iex> Ffaker.KoKr.Lorem.word
      "백두산이"
  """
  @spec word :: String.t
  def word do
    "words" |> list_file(@path) |> Enum.random
  end

  @doc """
  문장을 반환

  ## Parameters

    - words_range: 문장이 포함할 단어 수의 범위를 지정
      기본 값은 `4..8`

  ## Examples

      iex> Ffaker.KoKr.Lorem.sentence
      "동해물과 백두산이 마르고 닳도록."
  """
  @spec sentence(Enum.t) :: String.t
  def sentence(words_range \\ 4..8) do
    count = Enum.random(words_range)
    (1..count |> Enum.map(fn(_) -> word() end) |> Enum.join(" ")) <> "."
  end

  @doc """
  문단을 반환

  ## Parameters

    - sentences_range: 문단이 포함할 문장의 수를 지정
      기본 값은 `3..6`

  ## Examples

      iex> Ffaker.KoKr.Lorem.sentence
      "동해물과 백두산이 마르고 닳도록." <>
      "하나님이 보호하사 우리나라 만세." <>
      "무궁화 삼천리 화려강산." <>
      "대한 사람 대한으로 길이 보전하세."
  """
  @spec paragraph(Enum.t) :: String.t
  def paragraph(sentences_range \\ 3..6) do
    count = Enum.random(sentences_range)
    1..count |> Enum.map(fn(_) -> sentence() end) |> Enum.join(" ")
  end
end
