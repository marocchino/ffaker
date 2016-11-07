defmodule Ffaker.KoKr.LoremTest do
  use ExUnit.Case, async: true
  import Ffaker.KoKr.Lorem
  import Ffaker.Matcher, only: [assert_match: 2, assert_in_file: 3]
  @path "ko_kr/lorem"

  test "word/0" do
    assert_in_file(word(), "words", @path)
  end

  test "sentence/1" do
    assert_match ~r/\A[가-힇 ]+\.\z/, sentence()
  end

  test "paragraph/1" do
    assert_match ~r/\A(?:[가-힇 .]+ ?)+\z/, paragraph()
  end
end
