defmodule Ffaker.En.JobTest do
  use ExUnit.Case, async: true
  import Ffaker, only: [list_file: 1]
  import Ffaker.En.Job

  test "title/0" do
    [prefix, adj, noun] = String.split(title, " ")
    prefixes = list_file("data/en/job/prefixes")
    assert prefix in prefixes
    adjs = list_file("data/en/job/adjs")
    assert adj in adjs
    nouns = list_file("data/en/job/nouns")
    assert noun in nouns
  end

  test "prefix/0" do
    prefixes = list_file("data/en/job/prefixes")
    assert prefix in prefixes
  end

  test "adj/0" do
    adjs = list_file("data/en/job/adjs")
    assert adj in adjs
  end

  test "noun/0" do
    nouns = list_file("data/en/job/nouns")
    assert noun in nouns
  end
end
