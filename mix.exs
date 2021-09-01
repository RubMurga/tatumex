defmodule Tatumex.MixProject do
  use Mix.Project

  def project do
    [
      app: :tatumex,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A Middleware to use tatum on Elixir.",
      package: package()
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Ruben Murga"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/RubMurga/tatumex"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.7"},
      {:poison, "~> 5.0"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
