# In this file, we load production configuration and
# secrets from environment variables. You can also
# hardcode secrets, although such is generally not
# recommended and you have to remember to add this
# file to your .gitignore.
use Mix.Config

# database_url =
#   System.get_env("DATABASE_URL") ||
#     raise """
#     environment variable DATABASE_URL is missing.
#     For example: ecto://USER:PASS@HOST/DATABASE
#     """

config :shorten_api, ShortenApi.Repo,
  # ssl: true,
  # url: "ecto:///shorten_api_dev",
  database: "shorten_api_dev",
  hostname: "localhost",
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  "OvHSfhsHDQv6LdDyxx9ArTvCxB5C1zct1txooyhkuZV8oSYsR5fx0RjK9q8uXpbW" ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :shorten_api, ShortenApiWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: secret_key_base
