defmodule Ffaker.En.JobTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.En.Job

  test "title/0" do
    [prefix, adj, noun] = String.split(title(), " ")
    assert prefix in ~F(prefixes)
    assert adj in ~F(adjs)
    assert noun in ~F(nouns)
  end

  test "prefix/0" do
    assert prefix() in ~F(prefixes)
  end

  test "adj/0" do
    assert adj() in ~F(adjs)
  end

  test "noun/0" do
    assert noun() in ~F(nouns)
  end
end
