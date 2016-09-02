defmodule Ffaker.En.GenderTest do
  use ExUnit.Case, async: true
  doctest Ffaker.En.Gender
  import Ffaker.En.Gender

  test "gender/0" do
    assert gender in ~w(female male unknown)
  end

  test "female?/0, male?/0, unknown?/0" do
    case gender do
       "female" -> assert female?
       "male" -> assert male?
       _ -> assert unknown?
    end
  end
end
