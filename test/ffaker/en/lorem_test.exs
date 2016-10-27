defmodule Ffaker.En.LoremTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Lorem
  import Ffaker, only: [list_file: 2]
  @path "en/lorem"

  test "characters/1" do
    assert String.length(characters) == 255
    assert String.length(characters(3)) == 3
  end

  test "word/0" do
    words = list_file("words", @path)
    assert word in words
  end

  test "sentence/1" do
    actual = sentence
    assert Regex.match?(~r/\A[A-Z][a-z ]+\.\z/, actual),
           "#{actual} is not matched"
  end

  test "paragraph/1" do
    actual = paragraph
    assert Regex.match?(~r/\A(?:[A-Z][a-z .]+ ?)+\z/, actual),
           "#{actual} is not matched"
  end
end
