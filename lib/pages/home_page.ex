defmodule Z7ealthWebsite.HomePage do
  use Tableau.Page,
    layout: Z7ealthWebsite.RootLayout,
    permalink: "/"

  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <p>
      hello, world!
    </p>
    """
  end
end
