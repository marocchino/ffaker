defmodule Ffaker.En.InternetTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Internet
  @free_hosts ~w(gmail.com yahoo.com hotmail.com)
  @disposable_hosts ~w(mailinator.com
                       suremail.info
                       spamherelots.com
                       binkmail.com
                       safetymail.info)

  test "email/0" do
    assert Regex.match?(~r/\A[a-z.]+@[a-z.]+\z/, email),
          "#{email} is not matched"
  end

  test "disposable_email/0" do
    assert host(disposable_email) in @disposable_hosts
  end

  test "free_email/0" do
    assert host(free_email) in @free_hosts
  end

  test "safe_email/0" do
    actual = safe_email
    assert Regex.match?(~r/\A[a-z.]+@example\.(org|com|net)\z/, actual),
          "#{actual} is not matched"
  end

  test "user_name/0" do
    actual = user_name
    assert Regex.match?(~r/\A[a-z.]+\z/, actual),
          "#{actual} is not matched"
  end

  test "domain_name/0" do
    actual = domain_name
    assert Regex.match?(~r/\A[a-z.]+\z/, actual),
          "#{actual} is not matched"
  end

  test "uri/1" do
    actual = uri("ftp")
    assert Regex.match?(~r/\Aftp:\/\/[a-z.]+\z/, actual),
          "#{actual} is not matched"
  end

  test "uri/0" do
    actual = uri
    assert Regex.match?(~r/\Ahttps:\/\/[a-z.]+\z/, actual),
          "#{actual} is not matched"
  end

  test "ip_v4_address/0" do
    actual = ip_v4_address
    assert Regex.match?(~r/\A(?:\d{1,3}\.){3}\d{1,3}\z/, actual),
          "#{actual} is not matched"
  end

  test "slug/2" do
    assert slug("a b", ":") == "a:b"
  end

  test "slug/0" do
    actual = slug
    assert Regex.match?(~r/\A\w+[-_.]\w+\z/, actual),
          "#{actual} is not matched"
  end

  test "password/1" do
    actual = password(10..10)
    assert Regex.match?(~r/\A[a-z]{10}\z/, actual),
          "#{actual} is not matched"
  end
  test "password/0" do
    actual = password
    assert Regex.match?(~r/\A[a-z]{8,16}\z/, actual),
          "#{actual} is not matched"
  end

  test "mac/0" do
    actual = mac
    assert Regex.match?(~r/\A(?:[A-F0-9]{2}:){5}[A-F0-9]{2}\z/, actual),
          "#{actual} is not matched"
  end

  @spec host(String.t) :: String.t
  defp host(email) do
    email
    |> String.split("@")
    |> Enum.at(1)
  end
end
