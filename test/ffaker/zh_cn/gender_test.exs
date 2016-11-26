defmodule Ffaker.ZhCn.GenderTest do
  use ExUnit.Case, async: true
  import Ffaker.ZhCn.Gender

  test "gender/0" do
    assert gender() in ~w(女 男)
  end
end
