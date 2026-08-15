defmodule Z7ealthWebsite.HomePage do
  use Tableau.Page,
    layout: Z7ealthWebsite.RootLayout,
    permalink: "/"

  use Phoenix.Component

  import Z7ealthWebsite.Components,
    only: [
      hero: 1,
      section: 1,
      header: 1,
      core_skills: 1,
      stack: 1,
      timeline: 1,
      certifications: 1,
      projects: 1
    ]

  @about_me "I'm a Staff Platform Engineer with 10+ years across enterprise Linux, Kubernetes/OpenShift, VMware virtualization, and software engineering. I specialize in hybrid cloud platforms, OpenShift Virtualization, infrastructure automation, and troubleshooting complex enterprise environments at scale.
        I lead modernization initiatives, enterprise Linux operations, and VMware-to-Kubernetes migrations, and collaborate regularly with Red Hat TAMs, architects, and support engineering on critical infrastructure escalations."
  def template(assigns) do
    assigns = Map.put(assigns, :about_me, @about_me)

    ~H"""
    <.section class="px-4 sm:px-8 py-8 flex flex-col gap-16 justify-center items-center">
      <.hero />

      <div id="about" class="w-full max-w-4xl flex flex-col gap-2 scroll-mt-24">
        <.header title="About me" />
        <p class="text-xl text-justify">{@about_me}</p>
      </div>

      <div id="experience" class="w-full max-w-4xl flex flex-col gap-2 scroll-mt-24">
        <.header title="Experience" />
        <.timeline />
      </div>

      <div class="w-full max-w-4xl flex flex-col gap-2 scroll-mt-24">
        <.header title="Focus Areas" />
        <.core_skills />
      </div>

      <div id="skills" class="w-full max-w-4xl flex flex-col gap-2 scroll-mt-24">
        <.header title="Technical Skills" />
        <.stack />
      </div>

      <div id="certifications" class="w-full max-w-4xl flex flex-col gap-2 scroll-mt-24">
        <.header title="Certifications" />
        <.certifications />
      </div>

      <div id="projects" class="w-full max-w-4xl flex flex-col gap-2 scroll-mt-24">
        <.header title="Open Source & Personal Projects" />
        <.projects />
      </div>
    </.section>
    """
  end
end
