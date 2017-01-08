defmodule Ffaker.EnUs.PhoneNumber do
  @moduledoc"""
  Functions for US PhoneNumber data in English
  """

  use Ffaker
  import Ffaker, only: [numerify: 1]

  @doc"""
  Returns US phone number
  https://en.wikipedia.org/wiki/List_of_North_American_Numbering_Plan_area_codes

  ## Examples

      iex> Ffaker.EnUs.PhoneNumer.phone_number
      "1-201-345-6789 x235"
  """
  @spec phone_number() :: String.t
  def phone_number do
    suffix = [" x###", " x####", " x#####", ""] |> Enum.random |> numerify
    prefix = Enum.random(["1-", ""])
    "#{prefix}#{short_phone_number()}#{suffix}"
  end

  @doc"""
  Returns US area code
  https://en.wikipedia.org/wiki/List_of_North_American_Numbering_Plan_area_codes

  ## Examples

      iex> Ffaker.EnUs.PhoneNumer.area_code
      201
  """
  @spec area_code() :: non_neg_integer
  def area_code do
    201..999
    |> Enum.filter(fn code -> rem(code, 100) != 11 end)
    |> Enum.random
  end

  @doc"""
  Returns US exchange code
  https://en.wikipedia.org/wiki/North_American_Numbering_Plan#Numbering_system

  ## Examples

      iex> Ffaker.EnUs.PhoneNumer.exchange_code
      201
  """
  @spec exchange_code() :: non_neg_integer
  def exchange_code do
    Enum.random(201..999)
  end

  @doc"""
  Returns short US short phone number

  ## Examples

      iex> Ffaker.EnUs.PhoneNumer.short_phone_number
      "201-345-6789"
  """
  @spec short_phone_number() :: String.t
  def short_phone_number do
    "#{area_code()}-#{exchange_code()}-#{numerify("####")}"
  end

  @doc"""
  Returns US phone calling code

  ## Examples

      iex> Ffaker.EnUs.PhoneNumer.phone_calling_code
      "+91"
  """
  @spec phone_calling_code() :: String.t
  def phone_calling_code do
    Enum.random(~F(phone_calling_codes))
  end

  @doc"""
  Returns US imei

  ## Examples

      iex> Ffaker.EnUs.PhoneNumer.imei
      "001245001234569"
  """
  @spec imei(non_neg_integer) :: String.t
  def imei(numbers) do
    base_digits = "00124500#{numbers}"
    check_digit =
      base_digits |> String.graphemes |> Enum.reduce(0, &base_reducer/2)
    "#{base_digits}#{10 - check_digit}"
  end

  defp base_reducer(x, acc) do
    num =
      case String.to_integer(x) do
         n when rem(n, 2) == 0 -> n * 2
         n -> n
      end
    case rem(acc + num, 10) do
      0 -> 10
      n -> n
    end
  end
end
