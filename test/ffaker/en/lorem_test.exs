defmodule Ffaker.En.LoremTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.En.Lorem
  import Ffaker.Matcher, only: [assert_match: 2]

  test "characters/1" do
    assert String.length(characters()) == 255
    assert String.length(characters(3)) == 3
  end

  test "word/0" do
    assert word() in ~F(words)
  end

  test "sentence/1" do
    assert_match ~r/\A[A-Z][a-z ]+\.\z/, sentence()
  end

  test "paragraph/1" do
    assert_match ~r/\A(?:[A-Z][a-z .]+ ?)+\z/, paragraph()
  end
end
