defmodule TuteTweet.Mixfile do
  use Mix.Project

  def project do
    [app: :tute_tweet,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :quantum, :extwitter],
     mod: {TuteTweet, []}]
  end

  defp deps do
    [
      {:credo, "~> 0.7.4"},
      {:quantum, "~> 1.9"},
      {:extwitter, "~> 0.8.3"},
      {:oauth, github: "tim/erlang-oauth"}
    ]
  end
end
