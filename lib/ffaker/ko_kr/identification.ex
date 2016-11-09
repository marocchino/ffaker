defmodule Ffaker.KoKr.Identification do
  @moduledoc"""
  주민등록번호 데이터에 관함 함수가 들어있는 모듈
  """

  import Ffaker, only: [numerify: 1]

  @doc"""
  주민등록번호를 반환

  ## Examples
      iex> Ffaker.Kokr.Identification.rrn
      "701007-2590557"
  """
  @spec rrn() :: String.t
  def rrn do
    "19" <> birth = date()
    sex = Enum.random([1, 2])
    loc = numerify("#####")
    checksum = checksum("#{birth}#{sex}#{loc}")
    "#{birth}-#{sex}#{loc}#{checksum}"
  end

  defp date do
    start = :calendar.date_to_gregorian_days({1970, 1, 1})
    ends = :calendar.date_to_gregorian_days({1999, 12, 31})
    start..ends
    |> Enum.random
    |> :calendar.gregorian_days_to_date
    |> Date.from_erl!
    |> Date.to_string
    |> String.replace(~r/-/, "")
  end

  defp checksum(string) do
    [a, b, c, d, e, f, g, h, i, j, k, l] =
      string
      |> String.graphemes
      |> Enum.map(&String.to_integer/1)
    checksum =
      rem(
          11 - rem(2 * a + 3 * b + 4 * c + 5 * d + 6 * e + 7 * f + 8 * g +
                   9 * h + 2 * i + 3 * j + 4 * k + 5 * l,
                   11),
          10)
  end
end
