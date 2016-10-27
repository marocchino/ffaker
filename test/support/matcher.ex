defmodule Ffaker.Matcher do
  import ExUnit.Assertions, only: [assert: 2]
  def assert_match(regex, actual) do
    assert Regex.match?(regex, actual), "#{actual} is not match."
  end
end
