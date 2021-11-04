This is boilerplate with

- Phoenix 1.6.2 (incl. Auth)
- AlpineJS
- Tailwind
- Surface
- Explorer
- Gettext (added locale DE)

A little cheatsheet:

# New Phoenix Project

- Generate new project with `mix phx.new APP_NAME --no-ecto` (without db) or `mix phx.new APP_NAME` (with db)

# Server

- TO be available in local network change config.exs to `http: [ip: {0, 0, 0, 0}, port: 4000]`
- Start server with `mix phx.server`

# Database

- Create and migrate database with `mix ecto.setup`
- Run new migrations with `mix ecto.migrate`
- Reset database with `mix ecto.reset`

# Test

- Run tests with `mix test`
- Run single file tests with `mix test test/live_view_studio_web/live/topsecret_live_test.exs`

# Gettex

t
Files are stored in priv/gettext/[language]/LC_MESSAGES/default.po

- Add `config :demo, DemoWeb.Gettext, default_locale: "de", locales: ~w(de en)` to config/config.exs
- Search for new texts with `mix gettext.extract`
- Generate add all languages with
  `mix gettext.merge priv/gettext`

# IEX

- Start new session with `iex -S mix`

# Package Management

- Install dependencies with `mix deps.get`
- Recompile dependencies with `mix deps.compile`
- Delete dependencies with `mix deps.clean`
- Get newest version of a package with `mix hex.info <package.name>`

# Credo

- Initialize with `mix credo gen.config`
- Check project with `mix credo`

# Test Environment

- Prepend command with `MIX_ENV=test`

# Visual Studio Code

- Find file with `STRG + P`
- Open terminal with `STRG + SHIFT + ´`
