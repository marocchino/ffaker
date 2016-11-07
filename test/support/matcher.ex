defmodule Ffaker.Matcher do
  import ExUnit.Assertions, only: [assert: 2]
  import Ffaker, only: [list_file: 2]

  @spec assert_match(Regex.t, String.t) :: true
  def assert_match(regex, actual) do
    assert Regex.match?(regex, actual),
           "#{actual} is not match with #{inspect regex}."
  end

  @spec assert_in_file(String.t, String.t, String.t) :: true
  def assert_in_file(actual, file_name, dir_path) do
    list =
      if is_list(file_name) do
        file_name |> Enum.flat_map(&list_file(&1, dir_path))
      else
        list_file(file_name, dir_path)
      end
    assert actual in list,
           "#{actual} is not in `data/#{dir_path}/#{file_name}` file."
  end
end
