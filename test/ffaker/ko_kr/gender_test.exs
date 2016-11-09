defmodule Ffaker.KoKr.GenderTest do
  use ExUnit.Case, async: true
  import Ffaker.KoKr.Gender

  test "gender/0" do
    assert gender() in ~w(남 여)
  end
end
