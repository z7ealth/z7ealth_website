defmodule Z7ealthWebsite.PostLayout do
  use Tableau.Layout, layout: Z7ealthWebsite.RootLayout
  use Phoenix.Component

  def template(assigns) do
    ~H"""
    <%= {:safe, render(@inner_content)} %>
    """
  end
end
