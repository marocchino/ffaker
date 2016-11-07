defmodule Ffaker.En.GenderTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Gender

  test "gender/0" do
    assert gender() in ~w(female male unknown)
  end

  test "female?/0" do
    assert female?() in [true, false]
  end

  test "male?/0" do
    assert male?() in [true, false]
  end

  test "unknown?/0" do
    assert unknown?() in [true, false]
  end
end
