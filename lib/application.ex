defmodule EctoQueries.Application do
  use Application

  def start(_type, _args) do
    children = [
      {EctoQueries.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: EctoQueries.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
