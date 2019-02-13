defmodule DocProject.MixProject do
  use Mix.Project

  def project do
    [
      app: :doc_project,
      version: "0.1.0",
      name: "Doc Project",
      elixir: "~> 1.8",
      source_url: "https://github.com/Maultasche/LwmElixirCode/tree/master/examples/lwm%2064%20-%20Documentation/doc_project",
      start_permanent: Mix.env() == :prod,
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
      {:ex_doc, "~> 0.19.3", only: [:dev]},
      {:earmark, "~> 1.3", only: [:dev]}
    ]
  end
end
