defmodule Ffaker.Mixfile do
  use Mix.Project

  def project do
    [app: :ffaker,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     package: package(),
     description: description()]
  end

  def application do
    []
  end

  defp deps do
    []
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
