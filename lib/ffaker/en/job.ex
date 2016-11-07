defmodule Ffaker.En.Job do
  @moduledoc """
  Functions for job data in English
  """

  import Ffaker, only: [list_file: 2]

  @path "en/job"
  @suffixes ~w(Jr. Sr. I II III IV V MD DDS PhD DVM)
  @female_prefixes ~w(Mrs. Miss.)
  @other_prefixes ~w(Ms. Dr.)

  @doc """
  Returns job title

  ## Examples

      iex> Ffaker.En.Job.title
      "Internal Configuration Engineer"
  """
  @spec title() :: String.t
  def title do
    "#{prefix} #{adj} #{noun}"
  end

  @doc """
  Returns job prefix

  ## Examples

      iex> Ffaker.En.Job.prefix
      "Dynamic"
  """
  @spec prefix() :: String.t
  def prefix do
    "prefixes" |> list_file(@path) |> Enum.random
  end

  @doc """
  Returns job adj

  ## Examples

      iex> Ffaker.En.Job.adj
      "Solutions"
  """
  @spec adj() :: String.t
  def adj do
    "adjs" |> list_file(@path) |> Enum.random
  end

  @doc """
  Returns job noun

  ## Examples

      iex> Ffaker.En.Job.noun
      "Assistant"
  """
  @spec noun() :: String.t
  def noun do
    "nouns" |> list_file(@path) |> Enum.random
  end
end
