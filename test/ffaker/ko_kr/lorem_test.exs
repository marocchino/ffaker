defmodule Ffaker.KoKr.LoremTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.KoKr.Lorem
  import Ffaker.Matcher, only: [assert_match: 2]

  test "word/0" do
    assert word() in ~F(words)
  end

  test "sentence/1" do
    assert_match ~r/\A[가-힇 ]+\.\z/, sentence()
  end

  test "paragraph/1" do
    assert_match ~r/\A(?:[가-힇 .]+ ?)+\z/, paragraph()
  end
end
