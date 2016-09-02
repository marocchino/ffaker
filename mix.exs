defmodule Ffaker.Mixfile do
  use Mix.Project

  def project do
    [app: :ffaker,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package(),
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
     description: description()]
  end

  def application do
    []
  end

  defp deps do
    [{:excoveralls, "~> 0.5.6", only: :test},
     {:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev}]
  end

  defp description do
    """
    elixir porting of https://github.com/ffaker/ffaker
    """
  end

  defp package do
    [name: :ffaker,
     files: ["lib", "data", "mix.exs", "README.md", "LICENSE"],
     maintainers: ["marocchino"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/marocchino/ffaker"}]
  end
end
