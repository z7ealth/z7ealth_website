defmodule Z7ealthWebsite.RootLayout do
  use Tableau.Layout
  use Phoenix.Component

  import Z7ealthWebsite.Components, only: [navbar: 1, footer: 1]

  def template(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en" data-theme="halloween">
      <head>
        <meta charset="utf-8" />
        <meta http_equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>
          {[@page[:title], "z7ealth.dev"]
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

      <body class="flex flex-col min-h-screen">
        <.navbar />
        <main class="flex-1 py-8 px-20">
          {render(@inner_content)}
        </main>
        <.footer />
      </body>

      <%= if Mix.env() == :dev do %>
        {Phoenix.HTML.raw(Tableau.live_reload(assigns))}
      <% end %>

      <script src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js">
      </script>

      <script>
        new Typed('#typed', {
           strings: ["Héctor Alonso Salinas García"],
           typeSpeed: 80,
           loop: false,
           showCursor: false
           });

           new Typed('#typed-skills', {
           strings: ["Software Developer", "Linux", "Kubernetes", "Cloud"],
           startDelay: 3000,
           typeSpeed: 80,
           backSpeed: 80,
           backDelay: 2000,
           loop: true,
           showCursor: false
           });

      </script>
    </html>
    """
    |> Phoenix.HTML.Safe.to_iodata()
  end
end
