defmodule Ffaker.KoKr.Job do
  import Ffaker, only: [list_file: 2]
  @moduledoc """
  Functions for job data in English
  """
  @path "ko_kr/job"

  @doc """
  Returns job prefix

  ## Examples

      iex> Ffaker.KoKR.Job.title
      "Dynamic"
  """
  @spec title() :: String.t
  def title do
    "titles" |> list_file(@path) |> Enum.random
  end
end
