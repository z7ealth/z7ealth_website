defmodule Z7ealthWebsite.HomePage do
  use Tableau.Page,
    layout: Z7ealthWebsite.RootLayout,
    permalink: "/"

  use Phoenix.Component

  import Z7ealthWebsite.Components, only: [timeline: 1, hero: 1, section: 1]

  def template(assigns) do
    ~H"""
    <.section class="h-[calc(100vh-14rem)]">
      <div class="mt-48 px-8">
        <.hero />
      </div>
    </.section>
    <.section class="min-h-screen bg-neutral">
      <div class="p-12">
        <.timeline />
      </div>
    </.section>
    """
  end
end
