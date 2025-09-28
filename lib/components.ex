defmodule Z7ealthWebsite.Components do
  use Phoenix.Component

  embed_templates "./components/*"


  attr :class, :string, default: "h-screen"

  def section(assigns)
end
