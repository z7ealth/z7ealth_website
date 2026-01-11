defmodule Z7ealthWebsite.HomePage do
  use Tableau.Page,
    layout: Z7ealthWebsite.RootLayout,
    permalink: "/"

  use Phoenix.Component

  import Z7ealthWebsite.Components, only: [timeline: 1, hero: 1, section: 1, core_skills: 1]

  @about_me "I’m a Systems Engineer focused on application modernization, with a strong background in software development and Linux-based infrastructure. I work at the intersection of systems reliability and developer experience, building platforms that are scalable, fault-tolerant, and maintainable.
        Recently, I’ve been building distributed web applications using Elixir and the Phoenix Framework, while also working extensively with Linux, Kubernetes, and Ansible to design and operate production systems."
  def template(assigns) do
    assigns = Map.put(assigns, :about_me, @about_me)

    ~H"""
    <.section class="h-[calc(100vh-14rem)]">
      <div class="mt-48 px-8">
        <.hero />
      </div>
    </.section>
    <.section class="h-100 bg-base-200 flex flex-col items-center justify-center">
      <div class="p-6 bg-neutral max-w-prose leading-relaxed text-justify font-medium text-neutral-content rounded-4xl text-xs lg:text-lg shadow-xl">
        {@about_me}
      </div>
    </.section>
    <.section class="py-12 flex flex-col gap-8 items-center justify-center bg-neutral">
      <h1 class="font-bold text-2xl text-neutral-content">Core Skills</h1>
      <.core_skills />
    </.section>
    """
  end
end
