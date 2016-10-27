defmodule Ffaker.En.YoutubeTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Youtube
  import Ffaker, only: [list_file: 2]
  @path "en/youtube"

  test "url/0" do
    actual = url
    assert Regex.match?(~r/\Awww.youtube.com\/watch\?v=.+\z/, actual),
           "#{actual} is not matched"
  end

  test "share_url/0" do
    actual = share_url
    assert Regex.match?(~r/\Ayoutu.be\/.+\z/, actual),
           "#{actual} is not matched"
  end

  test "embed_url/0" do
    actual = embed_url
    assert Regex.match?(~r/\Awww.youtube.com\/embed\/.+\z/, actual),
           "#{actual} is not matched"
  end

  test "video_id/0" do
    video_ids = "video_ids" |> list_file(@path)
    assert video_id in video_ids
  end
end
