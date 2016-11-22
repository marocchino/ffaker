defmodule Ffaker.JaJp.LoremTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.JaJp.Lorem
  import Ffaker.Matcher, only: [assert_match: 2]

  test "character/0" do
    assert character() in ~F(characters)
  end

  test "word/0" do
    assert word() in ~F(words)
  end

  test "sentence/1" do
    assert sentence() in ~F(sentences)
  end

  test "paragraph/1" do
    assert_match ~r/\A.+\z/, paragraph()
  end
end
