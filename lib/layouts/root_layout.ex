defmodule Z7ealthWebsite.RootLayout do
  use Tableau.Layout
  use Phoenix.Component

  import Z7ealthWebsite.Components, only: [navbar: 1, footer: 1]

  def template(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en" data-theme="dark" class="scroll-smooth">
      <head>
        <meta charset="utf-8" />
        <meta http_equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="theme-color" content="#14171a" />
        <meta
          name="description"
          content="Héctor Salinas — Staff Platform Engineer specializing in Kubernetes, OpenShift, hybrid cloud and enterprise Linux."
        />

        <title>
          {[@page[:title], "z7ealth"]
          |> Enum.filter(& &1)
          |> Enum.intersperse("|")
          |> Enum.join(" ")}
        </title>

        <link rel="icon" href="/images/z7ealth.jpg" type="image/jpeg" />
        <link rel="stylesheet" href="/css/site.css" />
        <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
          href="https://fonts.googleapis.com/css2?family=Bitter:ital,wght@0,100..900;1,100..900&display=swap"
          rel="stylesheet"
        />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4">
        </script>

        <script src="/js/site.js" />
      </head>

      <body class="flex flex-col min-h-screen bg-base-100 text-base-content">
        <.navbar />
        <main class="flex-1">
          {render(@inner_content)}
        </main>
        <.footer />
      </body>

      <%= if Mix.env() == :dev do %>
        {Phoenix.HTML.raw(Tableau.live_reload(assigns))}
      <% end %>
    </html>
    """
    |> Phoenix.HTML.Safe.to_iodata()
  end
end
