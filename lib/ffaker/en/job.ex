defmodule Ffaker.En.Job do
  import Ffaker
  @moduledoc """
  Functions for job data in English
  """
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
    "data/en/job/prefixes"
    |> list_file
    |> Enum.random
  end

  @doc """
  Returns job adj

  ## Examples

      iex> Ffaker.En.Job.adj
      "Solutions"
  """
  @spec adj() :: String.t
  def adj do
    "data/en/job/adjs"
    |> list_file
    |> Enum.random
  end

  @doc """
  Returns job noun

  ## Examples

      iex> Ffaker.En.Job.noun
      "Assistant"
  """
  @spec noun() :: String.t
  def noun do
    "data/en/job/nouns"
    |> list_file
    |> Enum.random
  end
end
