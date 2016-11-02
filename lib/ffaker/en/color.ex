defmodule Ffaker.En.Color do
  import Ffaker, only: [list_file: 2]
  @moduledoc """
  Functions for color data in English
  """
  @colors ~w(female male unknown)
  @path "en/color"

  @doc """
  Returns color name

  ## Examples

      iex> Ffaker.En.Color.name
      "aqua"
  """
  @spec name() :: String.t
  def name do
    "names" |> list_file(@path) |> Enum.random
  end

  @doc """
  Returns color hex code

  ## Examples

      iex> Ffaker.En.Color.hex_code
      "00FA93"
  """
  @spec hex_code() :: String.t
  def hex_code do
    0..0xffffff
    |> Enum.random
    |> Integer.to_string(16)
    |> String.pad_leading(6, "0")
  end

  @doc """
  Returns rgb list

  ## Examples

      iex> Ffaker.En.Color.rgb
      [0, 12, 34]
  """
  @spec rgb() :: Enum.t
  def rgb do
    color = Enum.random(0..0xffffff)
    [div(color, 0x10000), rem(div(color, 0x100), 0x100), rem(color, 0x100)]
  end

  @doc """
  Returns hsl list

  ## Examples

      iex> Ffaker.En.Color.hsl
      [310, "12%", "34%"]
  """
  @spec hsl() :: Enum.t
  def hsl do
    h = Enum.random(0..360)
    s = "#{Enum.random(0..100)}%"
    l = "#{Enum.random(0..100)}%"
    [h, s, l]
  end

  @doc """
  Returns rgba list

  ## Examples

      iex> Ffaker.En.Color.rgba
      [0, 12, 34, 0.45]
  """
  @spec rgba() :: Enum.t
  def rgba do
    rgb ++ [alpha]
  end


  @doc """
  Returns hsla list

  ## Examples

      iex> Ffaker.En.Color.hsl
      [310, "12%", "34%", 0.98]
  """
  @spec hsla() :: Enum.t
  def hsla do
    hsl ++ [alpha]
  end
  @doc """
  Returns alpha number

  ## Examples

      iex> Ffaker.En.Color.alpha
      0.45
  """
  @spec alpha() :: non_neg_integer
  def alpha do
    Enum.random(0..100) / 100
  end
end
