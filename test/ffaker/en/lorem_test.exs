defmodule Ffaker.En.LoremTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Lorem
  import Ffaker, only: [list_file: 1]

  test "characters/1" do
    assert String.length(characters) == 255
    assert String.length(characters(3)) == 3
  end

  test "word/0" do
    words = list_file("data/en/lorem/words")
    assert word in words
  end

  test "sentence/1" do
    assert Regex.match?(~r/\A[A-Z][a-z ]+\.\z/, sentence)
  end

  test "paragraph/1" do
    assert Regex.match?(~r/\A(?:[A-Z][a-z .]+ ?)+\z/, paragraph)
  end
end
