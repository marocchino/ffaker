defmodule Ffaker.JaJp.Lorem do
  @moduledoc"""
  日本語ロレムデータを返す関数
  """

  use Ffaker

  @doc"""
  文字を返す

  ## Examples

      iex> Ffaker.JaJp.Lorem.character
      "あ"
  """
  @spec word :: String.t
  def character do
    Enum.random(~F(characters))
  end

  @doc"""
  単語を返す

  ## Examples

      iex> Ffaker.JaJp.Lorem.word
      "レンズ"
  """
  @spec word :: String.t
  def word do
    Enum.random(~F(words))
  end

  @doc"""
  文章を返す

  ## Examples

      iex> Ffaker.JaJp.Lorem.sentence
      "それをカムパネルラが忘れるはずもなかったのに"
  """
  @spec sentence :: String.t
  def sentence do
    Enum.random(~F(sentences))
  end

  @doc"""
  段落を返す

  ## Parameters

    - sentences_range: 문단이 포함할 문장의 수를 지정
      기본 값은 `3..6`

  ## Examples

      iex> Ffaker.JaJp.Lorem.sentence
      "その雑誌を読むと、" <>
      "すぐお父さんの書斎から巨きな本をもってきて、" <>
      "ぎんがというところをひろげ、" <>
      "やはりもじもじ立ち上がったままやはり答えができませんでした。"
  """
  @spec paragraph(Enum.t) :: String.t
  def paragraph(sentences_range \\ 3..6) do
    count = Enum.random(sentences_range)
    sentences =
      2..count
      |> Enum.map(fn(_) -> sentence() <> "、" end)
      |> Enum.join("")
    sentences <> Enum.random(~F(end_sentences))
  end
end
