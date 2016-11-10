defmodule Ffaker.EnUs.IdentificationTest do
  use ExUnit.Case, async: true
  import Ffaker.EnUs.Identification
  import Ffaker.Matcher, only: [assert_match: 2]

  @ethnicities ["African American", "Asian/Pacific Islander", "Caucasian",
                "Hispanic", "Native American", "Multiracial", "Other",
                "Prefer not to respond"]

  test "drivers_license/0" do
    assert_match ~r/\A[A-Z]\d{3}-\d{3}-\d{2}-\d{3}-\d\z/, drivers_license()
  end

  test "ssn/0" do
    assert_match ~r/\d{3}-\d{2}-\d{4}\z/, ssn()
  end

  test "ethnicity/0" do
    assert ethnicity() in @ethnicities
  end
end
