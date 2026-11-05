defmodule Z7ealthWebsite.RootLayout do
  use Tableau.Layout
  use Phoenix.Component

  def template(assigns) do
    # A per-build query string, so browsers fetch the new CSS/JS after each
    # deploy instead of reusing a cached copy of the same URL.
    assigns = Map.put(assigns, :v, System.system_time(:second))

    ~H"""
    <!DOCTYPE html>
    <html lang="en" class="scroll-smooth">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="theme-color" content="#15121c" />
        <meta
          name="description"
          content="Héctor Salinas — Staff Platform Engineer specializing in Kubernetes, OpenShift, hybrid cloud and enterprise Linux."
        />

        <title>
          {[@page[:title], "Héctor Salinas · Staff Platform Engineer"]
          |> Enum.filter(& &1)
          |> Enum.join(" | ")}
        </title>

        <link rel="icon" href="/images/z7ealth.jpg" type="image/jpeg" />
        <link
          rel="preload"
          href="/fonts/roboto-flex/roboto-flex-latin-opsz-normal.woff2"
          as="font"
          type="font/woff2"
          crossorigin
        />
        <link rel="stylesheet" href={"/css/site.css?v=#{@v}"} />
        <script defer src={"/js/site.js?v=#{@v}"}>
        </script>
        <%!-- No data-theme by default: the page follows the OS. A Light/Dark
              choice from the theme toggle is saved under "phx:theme";
              restore it before first paint. --%>
        <script>
          (() => {
            try {
              const theme = localStorage.getItem("phx:theme");
              if (theme) document.documentElement.setAttribute("data-theme", theme);
            } catch (_) {}
          })();
        </script>
      </head>

      <body class="bg-pp-surface text-pp-on-surface antialiased">
        <div class="page-tint" aria-hidden="true"></div>
        {render(@inner_content)}
      </body>

      <%= if Mix.env() == :dev do %>
        {Phoenix.HTML.raw(Tableau.live_reload(assigns))}
      <% end %>
    </html>
    """
    |> Phoenix.HTML.Safe.to_iodata()
  end
end
