defmodule Z7ealthWebsite.Components do
  @moduledoc """
  The site's own presentational pieces, shared in spirit with guiltty.dev and
  phoenixpaper.dev: the wordmark, eyebrow section headings, a terminal window
  drawn the way guiltty draws one, and brand marks heroicons doesn't have.
  Everything else on the page is PhoenixPaper.
  """
  use Phoenix.Component
  use PhoenixPaper.Components

  @email "ha_sg@outlook.com"
  @github "https://github.com/z7ealth"
  @credly "https://www.credly.com/users/z7ealth"

  def email, do: @email
  def github, do: @github
  def credly, do: @credly

  @doc "The avatar and the `z7ealth` wordmark."
  attr(:class, :any, default: nil)

  def wordmark(assigns) do
    ~H"""
    <span class={["inline-flex items-center gap-2.5", @class]}>
      <img src="/images/z7ealth.jpg" alt="" class="size-8 rounded-pp-full" />
      <span class="pp-title-large tracking-tight">z<span class="text-pp-primary">7</span>ealth</span>
    </span>
    """
  end

  @doc "An eyebrow, a display headline and an optional lead paragraph."
  attr(:eyebrow, :string, required: true)
  attr(:title, :string, required: true)
  attr(:class, :any, default: nil)
  slot(:inner_block)

  def section_header(assigns) do
    ~H"""
    <div class={["max-w-2xl", @class]}>
      <.pp_typography
        variant="label-large"
        color="primary"
        tag="p"
        class="uppercase tracking-[0.2em]"
      >
        {@eyebrow}
      </.pp_typography>
      <.pp_typography variant="display-small" emphasized tag="h2" class="mt-3 text-balance">
        {@title}
      </.pp_typography>
      <.pp_typography
        :if={@inner_block != []}
        variant="body-large"
        color="on-surface-variant"
        class="mt-4 text-pretty"
      >
        {render_slot(@inner_block)}
      </.pp_typography>
    </div>
    """
  end

  @doc """
  A terminal window as guiltty draws one: a KDE-style title bar, a monospace
  body and the flat tab bar at the bottom.
  """
  attr(:id, :string, required: true)
  attr(:title, :string, default: "guiltty")
  attr(:tabs, :list, default: [], doc: "{label, active?} tuples")
  attr(:class, :any, default: nil)
  slot(:inner_block, required: true)

  def terminal(assigns) do
    ~H"""
    <div id={@id} class={["term", @class]}>
      <div class="term-titlebar">
        <.guiltty_mark class="term-app-icon" />
        <span class="term-title">{@title}</span>
        <span class="term-controls" aria-hidden="true">
          <.pp_icon name="hero-chevron-up-micro" size="none" class="size-3.5" />
          <.pp_icon name="hero-minus-micro" size="none" class="size-3.5" />
          <.pp_icon name="hero-stop-micro" size="none" class="size-3" />
          <.pp_icon name="hero-x-mark-micro" size="none" class="size-3.5" />
        </span>
      </div>
      <div class="term-body">{render_slot(@inner_block)}</div>
      <div :if={@tabs != []} class="term-tabs" aria-hidden="true">
        <span :for={{label, active} <- @tabs} class={["term-tab", active && "is-active"]}>
          {label}
        </span>
      </div>
    </div>
    """
  end

  @doc "guiltty's mark (`|>_`), drawn in `currentColor`."
  attr(:class, :any, default: "size-6")

  def guiltty_mark(assigns) do
    ~H"""
    <svg
      viewBox="0 0 64 64"
      fill="none"
      class={@class}
      aria-hidden="true"
      stroke="currentColor"
      stroke-width="6.5"
      stroke-linecap="round"
      stroke-linejoin="round"
    >
      <path d="M8 18L8 46" />
      <path d="M17 18L31 32L17 46" />
      <path d="M42 46L56 46" />
    </svg>
    """
  end

  @doc "GitHub's mark (heroicons has none)."
  attr(:class, :any, default: "size-5")

  def github_mark(assigns) do
    ~H"""
    <svg viewBox="0 0 24 24" fill="currentColor" class={@class} aria-hidden="true">
      <path d="M12 .5a11.5 11.5 0 0 0-3.64 22.41c.58.1.79-.25.79-.56v-2c-3.2.7-3.88-1.37-3.88-1.37-.53-1.33-1.28-1.69-1.28-1.69-1.04-.71.08-.7.08-.7 1.16.08 1.77 1.19 1.77 1.19 1.03 1.76 2.7 1.25 3.36.96.1-.75.4-1.25.73-1.54-2.55-.29-5.24-1.28-5.24-5.68 0-1.26.45-2.28 1.19-3.09-.12-.29-.52-1.46.11-3.05 0 0 .97-.31 3.17 1.18a11 11 0 0 1 5.77 0c2.2-1.49 3.17-1.18 3.17-1.18.63 1.59.23 2.76.11 3.05.74.81 1.19 1.83 1.19 3.09 0 4.42-2.7 5.39-5.26 5.67.41.36.78 1.06.78 2.14v3.17c0 .31.21.67.8.56A11.5 11.5 0 0 0 12 .5Z" />
    </svg>
    """
  end
end
