defmodule Z7ealthWebsite.HomePage do
  use Tableau.Page,
    layout: Z7ealthWebsite.RootLayout,
    permalink: "/"

  use Phoenix.Component

  import Z7ealthWebsite.Components, only: [hero: 1, section: 1, header: 1, core_skills: 1, stack: 1]

  @about_me "I’m a Systems Engineer focused on application modernization, with a strong background in software development and Linux-based infrastructure. I work at the intersection of systems reliability and developer experience, building platforms that are scalable, fault-tolerant, and maintainable.
        Recently, I’ve been building distributed web applications using Elixir and the Phoenix Framework, while also working extensively with Linux, Kubernetes, and Ansible to design and operate production systems."
  def template(assigns) do
    assigns = Map.put(assigns, :about_me, @about_me)

    ~H"""
    <.section class="p-8 flex flex-col gap-4 justify-center items-center">
      <.hero />
      <div class="w-4xl flex flex-col gap-2">
        <.header title="About me" />
        <p class="text-xl text-justify">{@about_me}</p>
      </div>
      <div class="w-4xl flex flex-col gap-2">
        <.header title="Focus Areas" />
        <.core_skills />
      </div>
      <div class="w-4xl flex flex-col gap-2">
        <.header title="Main tech stack" />
        <.stack />
      </div>
      <div class="w-4xl flex flex-col gap-2">
        <.header title="Certifications" />
        <p class="text-xl">Feel free to explore my certifications on <a href="https://www.credly.com/users/z7ealth" target="_blank" class="text-primary underline">Credly</a></p>
      </div>
    </.section>
    """
  end
end
