defmodule Ffaker.EnUs.PhoneNumer do
  @moduledoc """
  Functions for US PhoneNumer data in English
  """

  import Ffaker, only: [list_file: 2, numerify: 1]

  @path "en_us/phone_number"

  @doc """
  Returns US phone_number
  https://en.wikipedia.org/wiki/List_of_North_American_Numbering_Plan_area_codes

  ## Examples

      iex> Ffaker.EnUs.PhoneNumer.phone_number
      "1-201-345-6789 x235"
  """
  @spec phone_number() :: String.t
  def phone_number do
    suffix = [" x###", " x####", " x#####", ""] |> Enum.random |> numerify
    prefix = ["1-", ""] |> Enum.random
    "#{prefix}#{short_phone_number()}#{suffix}"
  end

  @doc """
  Returns US area_code
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

  @doc """
  Returns US exchange_code
  https://en.wikipedia.org/wiki/North_American_Numbering_Plan#Numbering_system

  ## Examples

      iex> Ffaker.EnUs.PhoneNumer.exchange_code
      201
  """
  @spec exchange_code() :: non_neg_integer
  def exchange_code do
    201..999 |> Enum.random
  end

  @doc """
  Returns short US short_phone_number

  ## Examples

      iex> Ffaker.EnUs.PhoneNumer.short_phone_number
      "201-345-6789"
  """
  @spec short_phone_number() :: String.t
  def short_phone_number do
    "#{area_code()}-#{exchange_code()}-#{numerify("####")}"
  end

  @doc """
  Returns short US phone_calling_code

  ## Examples

      iex> Ffaker.EnUs.PhoneNumer.phone_calling_code
      "+91"
  """
  @spec phone_calling_code() :: String.t
  def phone_calling_code do
    "phone_calling_codes" |> list_file(@path) |> Enum.random
  end

  @doc """
  Returns short US imei

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
