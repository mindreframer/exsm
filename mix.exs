defmodule Exsm.MixProject do
  use Mix.Project

  def project do
    [
      app: :exsm,
      version: "0.3.2",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/sakshamgupta05/exsm",
      docs: [
        main: "Exsm",
        extras: ["README.md"]
      ],
      test_coverage: [tool: ExCoveralls]
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
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Exsm is a State Machine library for structs."
  end

  defp package() do
    [
      maintainers: ["Saksham Gupta"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/sakshamgupta05/exsm"}
    ]
  end
end
