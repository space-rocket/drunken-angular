# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :drunken_angular, DrunkenAngular.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "9jawdpu7bZyI8rIJkcA3WOGNsYYgOUSfhCr/XjlZ1BaEM+AzVTktFMJ5v9ps5gvX",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: DrunkenAngular.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :addict, user: DrunkenAngular.User,
                not_logged_in_url: "/forbidden",
                email_templates: DrunkenAngular.Presenters.EmailPresenter,
                db: DrunkenAngular.Repo,
                register_from_email: "DrunkenAngular <mail@yourawesomeapp.com>",
                register_subject: "Welcome to DrunkenAngular!",
                password_recover_from_email: "DrunkenAngular <no-reply@yourawesomeapp.com>",
                password_recover_subject: "DrunkenAngular password recovery"


