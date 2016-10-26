defmodule ExShards.Mixfile do
  use Mix.Project

  def project do
    [app: :exshards,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :shards]]
  end

  defp deps do
    [{:shards, "~> 0.3.1"}]
  end
end
