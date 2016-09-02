defmodule Ffaker.En.GenderTest do
  use ExUnit.Case, async: true
  doctest Ffaker.En.Gender
  import Ffaker.En.Gender

  test "gender/0" do
    assert gender in ~w(female male unknown)
  end

  test "female?/0, male?/0, unknown?/0" do
    case gender do
       "female" ->
         assert female?
         refute male?
         refute unknown?
       "male" ->
         refute female?
         assert male?
         refute unknown?
       _ ->
         refute female?
         refute male?
         assert unknown?
    end
  end
end
