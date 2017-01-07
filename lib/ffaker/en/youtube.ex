defmodule Ffaker.En.Youtube do
  @moduledoc"""
  Functions for Youtube url
  """

  use Ffaker

  @doc"""
  Returns url

  ## Examples

      iex> Ffaker.En.Youtube.url
      "www.youtube.com/watch?v=OPf0YbXqDm0"
  """
  @spec url() :: String.t
  def url do
    "www.youtube.com/watch?v=#{video_id()}"
  end

  @doc"""
  Returns share url

  ## Examples

      iex> Ffaker.En.Youtube.url
      "www.youtube.com/watch?v=OPf0YbXqDm0"
  """
  @spec share_url() :: String.t
  def share_url do
    "youtu.be/#{video_id()}"
  end

  @doc"""
  Returns embed url

  ## Examples

      iex> Ffaker.En.Youtube.url
      "www.youtube.com/embed/OPf0YbXqDm0"
  """
  @spec embed_url() :: String.t
  def embed_url do
    "www.youtube.com/embed/#{video_id()}"
  end

  @doc"""
  Returns video id

  ## Examples

      iex> Ffaker.En.Youtube.video_id
      "OPf0YbXqDm0"
  """
  @spec video_id() :: String.t
  def video_id do
    Enum.random(~F(video_ids))
  end
end
