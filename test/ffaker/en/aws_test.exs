defmodule Ffaker.En.AwsTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.En.Aws

  test "instance_type/0" do
    assert instance_type() in ~F(instance_types)
  end

  test "instance_tenancy/0" do
    assert instance_tenancy() in ~F(instance_tenancies)
  end

  test "offering_type/0" do
    assert offering_type() in ~F(offering_types)
  end

  test "product_description/0" do
    assert product_description() in ~F(product_descriptions)
  end
end
