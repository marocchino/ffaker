defmodule Ffaker.En.JobTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Job
  import Ffaker, only: [list_file: 2]
  @path "en/job"

  test "title/0" do
    [prefix, adj, noun] = String.split(title, " ")
    prefixes = list_file("prefixes", @path)
    assert prefix in prefixes
    adjs = list_file("adjs", @path)
    assert adj in adjs
    nouns = list_file("nouns", @path)
    assert noun in nouns
  end

  test "prefix/0" do
    prefixes = list_file("prefixes", @path)
    assert prefix in prefixes
  end

  test "adj/0" do
    adjs = list_file("adjs", @path)
    assert adj in adjs
  end

  test "noun/0" do
    nouns = list_file("nouns", @path)
    assert noun in nouns
  end
end
