defmodule Ffaker.Matcher do
  import ExUnit.Assertions, only: [assert: 2]

  @spec assert_match(Regex.t, String.t) :: true
  def assert_match(regex, actual) do
    assert Regex.match?(regex, actual),
           "#{actual} is not match with #{inspect regex}."
  end
end
