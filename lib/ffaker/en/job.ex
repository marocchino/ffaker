defmodule Ffaker.En.Job do
  @moduledoc"""
  Functions for job data in English
  """

  use Ffaker

  @doc"""
  Returns job title

  ## Examples

      iex> Ffaker.En.Job.title
      "Internal Configuration Engineer"
  """
  @spec title() :: String.t
  def title do
    "#{prefix()} #{adj()} #{noun()}"
  end

  @doc"""
  Returns job prefix

  ## Examples

      iex> Ffaker.En.Job.prefix
      "Dynamic"
  """
  @spec prefix() :: String.t
  def prefix do
    Enum.random(~F(prefixes))
  end

  @doc"""
  Returns job adj

  ## Examples

      iex> Ffaker.En.Job.adj
      "Solutions"
  """
  @spec adj() :: String.t
  def adj do
    Enum.random(~F(adjs))
  end

  @doc"""
  Returns job noun

  ## Examples

      iex> Ffaker.En.Job.noun
      "Assistant"
  """
  @spec noun() :: String.t
  def noun do
    Enum.random(~F(nouns))
  end
end
