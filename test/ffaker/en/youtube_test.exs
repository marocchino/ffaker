defmodule Ffaker.En.YoutubeTest do
  use ExUnit.Case, async: true
  use Ffaker
  import Ffaker.En.Youtube
  import Ffaker.Matcher, only: [assert_match: 2]

  test "url/0" do
    assert_match(~r/\Awww.youtube.com\/watch\?v=.+\z/, url())
  end

  test "share_url/0" do
    assert_match(~r/\Ayoutu.be\/.+\z/, share_url())
  end

  test "embed_url/0" do
    assert_match(~r/\Awww.youtube.com\/embed\/.+\z/, embed_url())
  end

  test "video_id/0" do
    assert video_id(), ~F(video_ids)
  end
end
