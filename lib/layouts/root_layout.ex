defmodule Z7ealthWebsite.RootLayout do
  use Tableau.Layout
  use Phoenix.Component
  use PhoenixPaper.Components

  import Z7ealthWebsite.Components

  @nav_links [
    {"About", "/#about"},
    {"Experience", "/#experience"},
    {"Skills", "/#skills"},
    {"Certifications", "/#certifications"},
    {"Projects", "/#projects"}
  ]

  def template(assigns) do
    assigns = Map.put(assigns, :nav_links, @nav_links)

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
          {[@page[:title], "z7ealth · Héctor Salinas"]
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
        <link rel="stylesheet" href="/css/site.css" />
        <script defer src="/js/site.js">
        </script>
        <%!-- No data-theme by default: the page follows the OS (PhoenixPaper's
              "System"). A Light/Dark choice from the theme toggle is saved
              under "phx:theme"; restore it before first paint. --%>
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
        <.pp_top_app_bar position="sticky" class="site-bar z-40 px-3 sm:px-6 lg:px-8">
          <:leading>
            <a
              href="/#top"
              class="flex items-center rounded-pp-full pp-focus-ring"
              aria-label="z7ealth home"
            >
              <.wordmark />
            </a>
          </:leading>
          <span class="sr-only">z7ealth</span>
          <:actions>
            <nav class="hidden lg:flex items-center gap-1 mr-2" aria-label="Sections">
              <.pp_button
                :for={{label, href} <- @nav_links}
                href={href}
                variant="text"
                color="secondary"
                class="px-4!"
              >
                {label}
              </.pp_button>
            </nav>
            <div class="hidden sm:flex">
              <.pp_tooltip title="z7ealth on GitHub" placement="bottom">
                <.pp_icon_button
                  href={github()}
                  label="z7ealth on GitHub"
                  target="_blank"
                  rel="noopener"
                >
                  <.github_mark />
                </.pp_icon_button>
              </.pp_tooltip>
            </div>
            <div class="hidden sm:flex"><.pp_theme_toggle /></div>
            <div class="hidden md:flex ml-2">
              <.pp_button href={"mailto:" <> email()}>Contact</.pp_button>
            </div>
            <.pp_icon_button
              id="mobile-nav-button"
              label="Menu"
              class="lg:hidden"
              aria-controls="mobile-nav"
              phx-click={PhoenixPaper.SideSheet.show("mobile-nav")}
            >
              <.pp_icon name="hero-bars-3" size="none" class="size-6" />
            </.pp_icon_button>
          </:actions>
        </.pp_top_app_bar>

        <%!-- Phones and tablets: the section links in a side sheet --%>
        <.pp_side_sheet id="mobile-nav">
          <:title>z7ealth</:title>
          <.pp_list aria-label="Sections">
            <.pp_list_item
              :for={{label, href} <- @nav_links}
              href={href}
              phx-click={PhoenixPaper.SideSheet.hide("mobile-nav")}
            >
              {label}
              <:trailing><.pp_icon name="hero-chevron-right" size="sm" /></:trailing>
            </.pp_list_item>
            <.pp_list_item href={"mailto:" <> email()}>
              Contact
              <:trailing><.pp_icon name="hero-envelope" size="sm" /></:trailing>
            </.pp_list_item>
          </.pp_list>
          <.pp_divider class="my-2" />
          <div class="flex items-center justify-between px-4 py-2">
            <.pp_typography variant="body-large" color="on-surface-variant" tag="span">
              Theme
            </.pp_typography>
            <.pp_theme_toggle />
          </div>
        </.pp_side_sheet>

        <main id="top">
          {render(@inner_content)}
        </main>

        <footer class="border-t border-pp-outline-variant bg-pp-surface-container-low">
          <div class="mx-auto max-w-6xl px-6 py-12 grid gap-10 md:grid-cols-[1.4fr_1fr_1fr_1fr]">
            <div class="space-y-3">
              <.wordmark />
              <p class="pp-body-medium text-pp-on-surface-variant max-w-sm">
                Héctor Salinas. Staff Platform Engineer in Monterrey, México, building
                OpenShift platforms by day and Elixir open source by night.
              </p>
              <div class="sm:hidden"><.pp_theme_toggle /></div>
            </div>
            <div>
              <p class="pp-title-small mb-3">Elsewhere</p>
              <ul class="space-y-2 pp-body-medium text-pp-on-surface-variant">
                <li>
                  <a class="footer-link" href={github()} target="_blank" rel="noopener">GitHub</a>
                </li>
                <li>
                  <a class="footer-link" href={credly()} target="_blank" rel="noopener">Credly</a>
                </li>
                <li><a class="footer-link" href={"mailto:" <> email()}>Email</a></li>
              </ul>
            </div>
            <div>
              <p class="pp-title-small mb-3">Projects</p>
              <ul class="space-y-2 pp-body-medium text-pp-on-surface-variant">
                <li>
                  <a class="footer-link" href="https://guiltty.dev" target="_blank" rel="noopener">
                    guiltty.dev
                  </a>
                </li>
                <li>
                  <a
                    class="footer-link"
                    href="https://phoenixpaper.dev"
                    target="_blank"
                    rel="noopener"
                  >
                    phoenixpaper.dev
                  </a>
                </li>
              </ul>
            </div>
            <div>
              <p class="pp-title-small mb-3">This site</p>
              <p class="pp-body-medium text-pp-on-surface-variant">
                Built with
                <a
                  class="footer-link text-pp-primary"
                  href="https://github.com/elixir-tools/tableau"
                  target="_blank"
                  rel="noopener"
                >
                  Tableau
                </a>
                and <a
                  class="footer-link text-pp-primary"
                  href="https://phoenixpaper.dev"
                  target="_blank"
                  rel="noopener"
                >PhoenixPaper</a>.
              </p>
            </div>
          </div>
          <div class="border-t border-pp-outline-variant">
            <p class="mx-auto max-w-6xl px-6 py-5 text-center pp-body-small text-pp-on-surface-variant">
              © {Date.utc_today().year} Héctor Salinas · z7ealth
            </p>
          </div>
        </footer>
      </body>

      <%= if Mix.env() == :dev do %>
        {Phoenix.HTML.raw(Tableau.live_reload(assigns))}
      <% end %>
    </html>
    """
    |> Phoenix.HTML.Safe.to_iodata()
  end
end
