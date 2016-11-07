defmodule Ffaker.KoKr.JobTest do
  use ExUnit.Case, async: true
  import Ffaker.KoKr.Job
  import Ffaker.Matcher, only: [assert_in_file: 3]
  @path "ko_kr/job"

  test "title/0" do
    assert_in_file(title(), "titles", @path)
  end
end
