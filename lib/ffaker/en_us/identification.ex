defmodule Ffaker.EnUs.Identification do
  @moduledoc"""
  Functions for US Identification data in English
  """

  import Ffaker, only: [numerify: 1]

  @ethnicities ["African American", "Asian/Pacific Islander", "Caucasian",
                "Hispanic", "Native American", "Multiracial", "Other",
                "Prefer not to respond"]

  @doc"""
  Returns US drivers license

  ## Examples

      iex> Ffaker.EnUs.Identification.drivers_license
      "A123-456-78-901-2"
  """
  @spec drivers_license() :: String.t
  def drivers_license do
    to_string([Enum.random(?A..?Z)]) <> numerify("###-###-##-###-#")
  end

  @doc"""
  Returns US social security number

  ## Examples

      iex> Ffaker.EnUs.Identification.ssn
      "123-45-6789"
  """
  def ssn do
    numerify("###-##-####")
  end

  @doc"""
  Returns US ethnicity

  ## Examples

      iex> Ffaker.EnUs.Identification.ethnicity
      "Hispanic"
  """
  def ethnicity do
    Enum.random(@ethnicities)
  end
end
