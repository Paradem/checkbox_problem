# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :checkbox_problem,
  ecto_repos: [CheckboxProblem.Repo]

# Configures the endpoint
config :checkbox_problem, CheckboxProblemWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oVLB/KrIEBMD0XL3IM1Cd6/CBwb+0ovXSHRR7/14C4n7+e6LCGF6FfoHzbd+mP/a",
  render_errors: [view: CheckboxProblemWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CheckboxProblem.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "XYNTl7YL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :checkbox_problem, CheckboxProblemWeb.Endpoint, live_view: [signing_salt: "SECRET_SALT"]
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
