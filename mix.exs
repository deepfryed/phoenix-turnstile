defmodule PhoenixTurnstile.MixProject do
  use Mix.Project

  @url "https://github.com/jsonmaur/phoenix-turnstile"

  def project do
    [
      app: :phoenix_turnstile,
      version: "1.0.0",
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      source_url: @url,
      homepage_url: "#{@url}#readme",
      description: "Use Cloudflare Turnstile in Phoenix apps",
      authors: ["Jason Maurer"],
      package: [
        licenses: ["MIT"],
        links: %{"GitHub" => @url}
      ],
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :inets, :ssl]
    ]
  end

  defp deps do
    [
      {:certifi, "~> 2.0"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:exvcr, "~> 0.11", only: :test, runtime: false},
      {:jason, "~> 1.0"},
      {:phoenix_live_view, "~> 0.17", optional: true}
    ]
  end

  defp aliases do
    [
      test: [
        "format --check-formatted",
        "deps.unlock --check-unused",
        "compile --warnings-as-errors",
        "test"
      ]
    ]
  end
end
