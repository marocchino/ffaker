defmodule Ffaker.KoKr.Job do
  import Ffaker, only: [list_file: 2]
  @moduledoc """
  Functions for job data in Korean
  """
  @path "ko_kr/job"

  @doc """
  Returns job title

  ## Examples

      iex> Ffaker.KoKr.Job.title
      "프로그레머"
  """
  @spec title() :: String.t
  def title do
    "titles" |> list_file(@path) |> Enum.random
  end
end
