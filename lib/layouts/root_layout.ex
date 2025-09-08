defmodule Z7ealthWebsite.RootLayout do
  use Tableau.Layout
  use Phoenix.Component

  import Z7ealthWebsite.Components, only: [navbar: 1]

  def template(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta http_equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>
          {[@page[:title], "z7ealth_website"]
          |> Enum.filter(& &1)
          |> Enum.intersperse("|")
          |> Enum.join(" ")}
        </title>

        <link rel="stylesheet" href="/css/site.css" />
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <link
          href="https://cdn.jsdelivr.net/npm/daisyui@5/themes.css"
          rel="stylesheet"
          type="text/css"
        />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4">
        </script>
        <script src="/js/site.js" />
      </head>

      <body>
        <.navbar />
        <main>
          {render(@inner_content)}
        </main>
      </body>

      <%= if Mix.env() == :dev do %>
        {Phoenix.HTML.raw(Tableau.live_reload(assigns))}
      <% end %>
    </html>
    """
    |> Phoenix.HTML.Safe.to_iodata()
  end
end
