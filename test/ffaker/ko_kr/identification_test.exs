defmodule Ffaker.KoKr.IdentificationTest do
  use ExUnit.Case, async: true
  import Ffaker.KoKr.Identification
  import Ffaker.Matcher, only: [assert_match: 2]

  test "rrn/0" do
    assert_match ~r/\A\d{6}-\d{7}\z/, rrn()
  end
end
