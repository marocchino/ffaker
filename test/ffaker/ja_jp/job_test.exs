defmodule Ffaker.JaJp.JobTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.JaJp.Job

  test "title/0" do
    assert title() in ~F(titles)
  end
end
