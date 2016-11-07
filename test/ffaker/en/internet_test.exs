defmodule Ffaker.En.InternetTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Internet
  import Ffaker.Matcher, only: [assert_match: 2]

  @free_hosts ~w(gmail.com yahoo.com hotmail.com)
  @disposable_hosts ~w(mailinator.com
                       suremail.info
                       spamherelots.com
                       binkmail.com
                       safetymail.info)

  test "email/0" do
    assert_match ~r/\A[a-z.]+@[a-z.]+\z/, email()
  end

  test "disposable_email/0" do
    assert host(disposable_email()) in @disposable_hosts
  end

  test "free_email/0" do
    assert host(free_email()) in @free_hosts
  end

  test "safe_email/0" do
    assert_match ~r/\A[a-z.]+@example\.(org|com|net)\z/, safe_email()
  end

  test "user_name/0" do
    assert_match ~r/\A[a-z.]+\z/, user_name()
  end

  test "domain_name/0" do
    assert_match ~r/\A[a-z.]+\z/, domain_name()
  end

  test "uri/1" do
    assert_match ~r/\Aftp:\/\/[a-z.]+\z/, uri("ftp")
  end

  test "uri/0" do
    assert_match ~r/\Ahttps:\/\/[a-z.]+\z/, uri()
  end

  test "ip_v4_address/0" do
    assert_match ~r/\A(?:\d{1,3}\.){3}\d{1,3}\z/, ip_v4_address()
  end

  test "slug/2" do
    assert slug("a b", ":") == "a:b"
  end

  test "slug/0" do
    assert_match ~r/\A\w+[-_.]\w+\z/, slug()
  end

  test "password/1" do
    assert_match ~r/\A[a-z]{10}\z/, password(10..10)
  end
  test "password/0" do
    assert_match ~r/\A[a-z]{8,16}\z/, password()
  end

  test "mac/0" do
    assert_match ~r/\A(?:[A-F0-9]{2}:){5}[A-F0-9]{2}\z/, mac()
  end

  @spec host(String.t) :: String.t
  defp host(email) do
    email
    |> String.split("@")
    |> Enum.at(1)
  end
end
