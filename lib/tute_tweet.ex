defmodule TuteTweet do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      worker(TuteTweet.TweetServer, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TuteTweet.Supervisor]
    process = Supervisor.start_link(children, opts)
    TuteTweet.Scheduler.schedule_file(
      "* * * * *",
      Path.join("#{:code.priv_dir(:tute_tweet)}", "sample.txt")
    )
    process
  end
end
