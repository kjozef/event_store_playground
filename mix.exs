defmodule EventStoreTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :event_store_test,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {EventStoreTest.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:eventstore, "~> 1.3.0"},
      {:jason, "~> 1.3"}
    ]
  end
end
