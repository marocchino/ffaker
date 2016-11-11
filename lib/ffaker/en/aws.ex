defmodule Ffaker.En.Aws do
  @moduledoc"""
  Functions for AWS data in English
  """

  use Ffaker

  @doc"""
  Returns aws instance type

  ## Examples

      iex> Ffaker.En.Aws.instance_type
      "m4.2xlarge"
  """
  @spec instance_type() :: String.t
  def instance_type do
    Enum.random(~F(instance_types))
  end

  @doc"""
  Returns aws offering type

  ## Examples

      iex> Ffaker.En.Aws.offering_type
      "Heavy Utilization"
  """
  @spec offering_type() :: String.t
  def offering_type do
    Enum.random(~F(offering_types))
  end

  @doc"""
  Returns aws offering type

  ## Examples

      iex> Ffaker.En.Aws.instance_tenancy
      "default"
  """
  @spec instance_tenancy() :: String.t
  def instance_tenancy do
    Enum.random(~F(instance_tenancies))
  end

  @doc"""
  Returns aws offering type

  ## Examples

      iex> Ffaker.En.Aws.product_description
      "Red Hat Enterprise Linux"
  """
  @spec product_description() :: String.t
  def product_description do
    Enum.random(~F(product_descriptions))
  end
end
