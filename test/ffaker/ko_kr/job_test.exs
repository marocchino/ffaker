defmodule Ffaker.KoKr.JobTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.KoKr.Job

  test "title/0" do
    assert title() in ~F(titles)
  end
end
