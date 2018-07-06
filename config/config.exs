use Mix.Config

config :ecto_queries, ecto_repos: [EctoQueries.Repo]

config :ecto_queries, EctoQueries.Repo,
  database: "ecto_queries",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
