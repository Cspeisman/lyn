defmodule Lyn.Mixfile do
  use Mix.Project

  def project do
    [app: :lyn,
     version: "0.0.16",
     elixir: "~> 1.3.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers ++ [:reaxt_webpack],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     description: description,
     package: package,
     deps: deps,
     docs: docs]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    dev_apps = Mix.env == :dev && [:reprise] || []

    [mod: {Lyn, []},
     applications: [:phoenix,
                    :phoenix_html,
                    :cowboy,
                    :logger,
                    :gettext,
                    :phoenix_ecto,
                    :postgrex,
                    :comeonin,
                    :ueberauth,
                    :ueberauth_facebook,
                    :ueberauth_github,
                    :ueberauth_google,
                    :ueberauth_identity,
                    :ueberauth_slack,
                    :ueberauth_twitter,
                    :exos,
                    :poolboy,
                    :absinthe_plug] ++ dev_apps]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:absinthe_plug, "~> 1.2.0"},
     {:comeonin, "~> 3.0.1"},
     {:cowboy, "~> 1.0.4"},
     {:dogma, "~> 0.1.13", only: :dev},
     {:earmark, "~> 1.0.3"},
     {:ex_doc, "~> 0.14.5", only: :dev},
     {:ex_machina, "~> 1.0", only: [:dev, :test, :staging, :qa]},
     {:exos, "1.0.0"},
     {:ecto, "~> 2.0.0"},
     {:gettext, "~> 0.13.0"},
     {:guardian_db, "~> 0.7.0"},
     {:guardian, "~> 0.14.0"},
     {:inflex, "~> 1.8.0"},
     {:json, "~> 1.0.0"},
     {:oauth, github: "tim/erlang-oauth"},
     {:phoenix, "~> 1.2.1"},
     {:postgrex, "~> 0.11.0"},
     {:phoenix_ecto, "~> 3.0"},
     {:phoenix_html, "2.9.2"},
     {:phoenix_live_reload, "~> 1.0.6", only: :dev},
     {:poison, "~> 2.0.0"},
     {:poolboy, "~> 1.5.1"},
     {:postgrex, ">= 0.0.0"},
     {:reprise, "~> 0.5", only: :dev},
     {:scrivener, "~> 2.1.1"},
     {:ueberauth, "~> 0.4.0"},
     {:ueberauth_facebook, "~> 0.6.0"},
     {:ueberauth_github, "~> 0.4.1"},
     {:ueberauth_google, "~> 0.5.0"},
     {:ueberauth_identity, "~> 0.2.3"},
     {:ueberauth_slack, ">= 0.0.0"},
     {:ueberauth_twitter, "~> 0.2.3"}]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end

  defp description do
    """
    This is a CMS written in Elixir. Aims to be the great open-source ecommerce and/or startup
    solution for those who are searching for a performance and stability on top of modern technologies
    like React and Elixir.
    """
  end

  defp docs do
    [
      extras: [
        "README.md",
        "ROADMAP.md",
        "CONTRIBUTING.md"
      ]
    ]
  end

  defp package do
    [# These are the default files included in the package
     files: [
       "config/config.exs",
       "config/dev.exs",
       "config/prod.exs",
       "config/test.exs",
       "docs",
       "lib",
       "priv/commonjs_reaxt",
       "priv/gettext",
       "priv/repo",
       "scripts",
       "web",
       ".babelrc",
       ".eslintrc",
       ".eslintignore",
       ".iex.exs",
       "mix.exs",
       "mix.lock",
       "package.json",
       "webpack.config.js",
       "README.md",
       "ROADMAP.md",
       "LICENSE.md"
     ],
     maintainers: ["Valerii Iatsko"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/viatsko/lyn",
              "Docs" => "https://github.com/viatsko/lyn/tree/master/docs"}]
  end
end
