defmodule Ffaker.EnUs.Identification do
  @moduledoc"""
  Functions for US Identification data in English
  """

  import Ffaker, only: [numerify: 1]

  @ethnicities ["African American", "Asian/Pacific Islander", "Caucasian",
                "Hispanic", "Native American", "Multiracial", "Other",
                "Prefer not to respond"]

  def drivers_license do
    to_string([Enum.random(?A..?Z)]) <> numerify("###-###-##-###-#")
  end

  def ssn do
    numerify("###-##-####")
  end

  def ethnicity do
    Enum.random(@ethnicities)
  end
end
