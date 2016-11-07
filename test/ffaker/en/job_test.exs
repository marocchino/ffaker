defmodule Ffaker.En.JobTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Job
  import Ffaker.Matcher, only: [assert_in_file: 3]

  @path "en/job"

  test "title/0" do
    [prefix, adj, noun] = String.split(title(), " ")
    assert_in_file(prefix, "prefixes", @path)
    assert_in_file(adj, "adjs", @path)
    assert_in_file(noun, "nouns", @path)
  end

  test "prefix/0" do
    assert_in_file(prefix(), "prefixes", @path)
  end

  test "adj/0" do
    assert_in_file(adj(), "adjs", @path)
  end

  test "noun/0" do
    assert_in_file(noun(), "nouns", @path)
  end
end
