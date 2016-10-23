defmodule Ffaker.En.Lorem do
  import Ffaker
  @moduledoc """
  Functions for lorem data in English
  """

  @doc """
  Returns characters

  ## Parameters

    - count: max length of characters, default is `255`

  ## Examples

      iex> Ffaker.En.Lorem.characters
      "g5nn5wbqp3t748bivku9o6w8wjgw7ngsj9efprdweidqyccu37x6yuwb07kbfb9sntz08" <>
      "5kej2sxcxolm2k55zb9pwtyik90seavo8i6hn15x51n79htv8oemmnufb7wq1cgo6t72g" <>
      "zgb5l1j3ztm3crbm3ex5vcg8p0mk6cgtyfkysgmwqtisvbf85r776ddkylwus7jffiluk" <>
      "fdga6godyi5p2s4w1vz8tidq7dhvr6wke8u49vw59wygrjny"
      iex> Ffaker.En.Lorem.characters(3)
      "abc"
  """
  @spec characters(number) :: String.t
  def characters(count \\ 255) do
    characters = list_file("data/en/lorem/characters")
    Enum.reduce(1..count, "", fn(_, acc) ->
      acc <> Enum.random(characters)
    end)
  end

  @doc """
  Returns word

  ## Examples

      iex> Ffaker.En.Lorem.word
      "lorem"
  """
  @spec word :: String.t
  def word do
    "data/en/lorem/words"
    |> list_file
    |> Enum.random
  end

  @doc """
  Returns sentence

  ## Parameters

    - words_range: Range of number of words included in a sentence,
      default is `4..8`

  ## Examples

      iex> Ffaker.En.Lorem.sentence
      "Lorem epsum elit sed do."
  """
  @spec sentence(Enum.t) :: String.t
  def sentence(words_range \\ 4..8) do
    count = Enum.random(words_range)
    (1..count
     |> Enum.map(fn(_) -> word end)
     |> Enum.join(" ")
     |> String.capitalize) <> "."
  end

  @doc """
  Returns paragraph

  ## Parameters

    - sentences_range: Range of number of sentences included in a paragraph,
      default is `3..6`

  ## Examples

      iex> Ffaker.En.Lorem.sentence
      "Consequatur reiciendis dicta et exercitationem quod voluptatibus. " <>
      "Unde dolorem aut eius corporis aperiam. " <>
      "Quis rem dolorem fugit consequatur dolorem."
  """
  @spec paragraph(Enum.t) :: String.t
  def paragraph(sentences_range \\ 3..6) do
    count = Enum.random(sentences_range)
    1..count
    |> Enum.map(fn(_) -> sentence end)
    |> Enum.join(" ")
  end
end
