defmodule Z7ealthWebsite.MixProject do
  use Mix.Project

  def project do
    [
      app: :z7ealth_website,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers(),
      aliases: aliases(),
      deps: deps()
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
      {:tableau, "~> 0.26"},
      {:tailwind, "~> 0.5", runtime: Mix.env() == :dev},
      {:phoenix_live_view, "~> 1.2"},
      {:phoenix_paper, "~> 0.5.6"},
      {:esbuild, "~> 0.10", runtime: Mix.env() == :dev},
      {:heroicons,
       github: "tailwindlabs/heroicons",
       tag: "v2.2.0",
       sparse: "optimized",
       app: false,
       compile: false,
       depth: 1}
    ]
  end

  defp aliases do
    [
      build: ["tableau.build", "tailwind default --minify", "esbuild default --minify"]
    ]
  end
end
