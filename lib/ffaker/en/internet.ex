defmodule Ffaker.En.Internet do
  alias Ffaker.En.Name
  alias Ffaker.En.Lorem

  @moduledoc """
  Functions for internet data in English
  """
  @hosts ~w(gmail.com yahoo.com hotmail.com)
  @free_hosts ~w(gmail.com yahoo.com hotmail.com)
  @disposable_hosts ~w(mailinator.com
                       suremail.info
                       spamherelots.com
                       binkmail.com
                       safetymail.info)
  @domain_suffixes ~w(co.uk com us ca biz info name)
  @safe_domain_suffixes ~w(org com net)
  @slug_delimiters ~w(- _ .)

  @doc """
  Returns internet

  ## Examples

      iex> Ffaker.En.Internet.email
      "dustin.oberbrunner@gmail.com"
  """
  @spec email() :: String.t
  def email do
    "#{user_name}@#{@hosts |> Enum.random}"
  end

  @doc """
  Returns internet

  ## Examples

      iex> Ffaker.En.Internet.disposable_email
      "dustin.oberbrunner@mailinator.com"
  """
  @spec disposable_email() :: String.t
  def disposable_email do
    "#{user_name}@#{@disposable_hosts |> Enum.random}"
  end

  @doc """
  Returns internet

  ## Examples

      iex> Ffaker.En.Internet.disposable_email
      "dustin.oberbrunner@gmail.com"
  """
  @spec free_email() :: String.t
  def free_email do
    "#{user_name}@#{@free_hosts |> Enum.random}"
  end

  @doc """
  Returns internet

  ## Examples

      iex> Ffaker.En.Internet.disposable_email
      "dustin.oberbrunner@example.com"
  """
  @spec safe_email() :: String.t
  def safe_email do
    "#{user_name}@example.#{@safe_domain_suffixes |> Enum.random}"
  end

  @doc """
  Returns user_name

  ## Examples

      iex> Ffaker.En.Internet.user_name
      "dustin.oberbrunner"
  """
  @spec user_name() :: String.t
  def user_name do
    Name.name
    |> escape
  end

  @doc """
  Returns domain_name

  ## Examples

      iex> Ffaker.En.Internet.domain_name
      "oberbrunner.com"
  """
  @spec domain_name() :: String.t
  def domain_name do
    "#{Name.last_name |> escape}#{@domain_suffixes |> Enum.random}"
  end

  @doc """
  Returns uri

  ## Examples

      iex> Ffaker.En.Internet.uri
      "https://oberbrunner.com"
  """
  @spec uri(String.t) :: String.t
  def uri(protocol \\ "https") do
    "#{protocol}://#{domain_name}"
  end

  @doc """
  Returns ip_v4_address

  ## Examples

      iex> Ffaker.En.Internet.ip_v4_address
      "192.168.0.1"
  """
  @spec ip_v4_address() :: String.t
  def ip_v4_address do
    [0..255, 0..255, 0..255, 0..255]
    |> Enum.map(&Enum.random/1)
    |> Enum.join(".")
  end

  @doc """
  Returns slug

  ## Examples

      iex> Ffaker.En.Internet.slug
      "quia-ipsa"
  """
  @spec slug(Enum.t, String.t) :: String.t
  def slug(words \\ nil, glue \\ nil) do
    words = words ||
            2..2
            |> Lorem.sentence
            |> String.trim(".")
    glue = glue || @slug_delimiters |> Enum.random

    words
    |> String.downcase
    |> String.replace(~r/\W/, glue)
  end

  @doc """
  Returns password

  ## Examples

      iex> Ffaker.En.Internet.password
      "aysqkeiksw"
  """
  @spec password(Range.t) :: String.t
  def password(length_range \\ 8..16) do
    length = length_range |> Enum.random
    1..length
    |> Enum.map(fn _ -> ?a..?z |> Enum.random end)
    |> to_string

  end

  @doc """
  Returns mac

  ## Examples

      iex> Ffaker.En.Internet.mac
      "DC:4B:61:EB:30:8A"
  """
  @spec mac() :: String.t
  def mac do
    1..281_474_976_710_655
    |> Enum.random
    |> Integer.to_string(16)
    |> String.pad_leading(12, "0")
    |> String.replace(~r(..), "\\0:")
    |> String.trim(":")
  end

  @spec escape(String.t) :: String.t
  defp escape(str) do
    str
    |> String.downcase
    |> String.replace(~r([^a-z]), ".")
  end
end
