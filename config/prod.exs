import Config

config :tableau, :config, url: "https://z7ealth.dev"
config :tableau, Tableau.PostExtension, future: false, dir: ["_posts"]
config :tableau, Tableau.PageExtension, dir: ["_pages"]
