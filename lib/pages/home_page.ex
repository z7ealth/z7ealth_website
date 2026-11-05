defmodule Z7ealthWebsite.HomePage do
  use Tableau.Page,
    layout: Z7ealthWebsite.RootLayout,
    permalink: "/"

  use Phoenix.Component
  use PhoenixPaper.Components

  import Z7ealthWebsite.Components

  @nav [
    {"about", "About"},
    {"experience", "Experience"},
    {"projects", "Projects"},
    {"skills", "Skills"},
    {"certifications", "Certifications"}
  ]

  @jobs [
    %{
      period: "2025 — Now",
      role: "OpenShift Architect / Platform Engineer",
      org: "OXXO",
      body:
        "Designed and implemented enterprise OpenShift infrastructure across the Monterrey and Querétaro data centers. Led the migration of 120+ VMware virtual machines into OpenShift Virtualization, built a custom Forklift controller image to unblock production ahead of an official upstream fix, and implemented the Dell PowerMax CSI integration later referenced by Dell engineering teams.",
      tags: ["OpenShift", "OpenShift Virtualization", "Forklift/MTV", "Dell PowerMax CSI"]
    },
    %{
      period: "2025 — Now",
      role: "Linux Platform Manager",
      org: "The Home Depot México",
      body:
        "Lead enterprise Linux platform operations and governance across critical production infrastructure. Implemented Red Hat Satellite 6.16 for centralized patch management and content lifecycle, and manage Red Hat IdM, Ansible automation, Linux hardening, and RHEL upgrade programs.",
      tags: ["RHEL", "Satellite", "Red Hat IdM", "Ansible"]
    },
    %{
      period: "2022 — 2024",
      role: "Cloud Architect",
      org: "OXXO",
      body:
        "Designed cloud architectures for enterprise modernization initiatives and led the technical migration of Java monoliths toward cloud-native microservices, partnering with development and infrastructure teams on architecture and governance.",
      tags: ["Azure", "Tanzu", "Microservices"]
    },
    %{
      period: "2021 — 2022",
      role: "Linux System Administrator",
      org: "The Home Depot México",
      body:
        "Administered Red Hat Enterprise Linux environments supporting enterprise production workloads: incidents, OS maintenance, patching and troubleshooting.",
      tags: ["RHEL", "Patching"]
    },
    %{
      period: "2016 — 2021",
      role: "Software Engineer",
      org: "Daltum Systems · Inmar Winston Data · Osiris HealthTech · Concéntrico · NHPSoft",
      body:
        "Full-stack and backend roles building web applications, before moving into platform and infrastructure engineering.",
      tags: ["Full stack", "Backend"]
    }
  ]

  @projects [
    %{
      name: "guiltty",
      mark: "/images/projects/guiltty.svg",
      href: "https://guiltty.dev",
      host: "guiltty.dev",
      body:
        "A GPU-accelerated terminal emulator for Linux in Elixir and C. Every tab is a supervised process tree and the renderer is its own OS process, so when something crashes, its supervisor restarts it and your tabs stay.",
      tags: ["Elixir", "C", "Vulkan", "OpenGL"]
    },
    %{
      name: "PhoenixPaper",
      mark: "/images/projects/phoenixpaper.svg",
      href: "https://phoenixpaper.dev",
      host: "phoenixpaper.dev",
      body:
        "Material Design 3, including M3 Expressive, as a component library for Phoenix and LiveView, styled with Tailwind CSS. This site is built with it.",
      tags: ["Elixir", "Phoenix", "LiveView", "Tailwind"]
    },
    %{
      name: "kubevirt-tools",
      icon: "hero-squares-2x2",
      href: "https://github.com/z7ealth",
      host: "github.com",
      body:
        "RVTools-style inventory, visibility and assessment for KubeVirt and OpenShift Virtualization environments.",
      tags: ["KubeVirt", "OpenShift"]
    },
    %{
      name: "extop",
      icon: "hero-cpu-chip",
      href: "https://github.com/z7ealth/extop",
      host: "github.com",
      body:
        "A terminal system monitor for Linux on the BEAM, in the spirit of btop, with a ratatui TUI.",
      tags: ["Elixir", "TUI"]
    },
    %{
      name: "EXKL",
      icon: "hero-fire",
      href: "https://github.com/z7ealth/exkl",
      host: "github.com",
      body:
        "An open-source Linux service for DeepCool AK-series digital coolers: monitoring and display support, replacing the vendor's proprietary software.",
      tags: ["Elixir", "Phoenix", "LiveView"]
    }
  ]

  @skills [
    {"Platform",
     [
       "OpenShift",
       "Kubernetes",
       "KubeVirt",
       "OpenShift Virtualization",
       "Forklift/MTV",
       "Operators",
       "Helm",
       "Kustomize"
     ]},
    {"Linux", ["RHEL 7/8/9", "Red Hat Satellite", "Red Hat IdM", "SELinux", "Ansible"]},
    {"Infrastructure", ["VMware vSphere 8", "Tanzu", "Microsoft Azure"]},
    {"Storage",
     ["OpenShift Data Foundation (Ceph)", "Dell PowerMax CSI", "CDI / StorageProfiles"]},
    {"Observability", ["Prometheus", "Alertmanager", "Grafana"]},
    {"Languages", ["Elixir / Phoenix", "Go", "C", "TypeScript", "JavaScript", "Bash"]}
  ]

  @certifications [
    {"Red Hat Certified System Administrator", "Red Hat · EX200", "2026"},
    {"Red Hat Certified OpenShift Administrator", "Red Hat · EX280", "2026"},
    {"Certified Kubernetes Administrator", "CNCF · CKA", "2024"},
    {"Azure Administrator Associate", "Microsoft · AZ-104", "2024"},
    {"VMware Certified Master Specialist — Cloud Native", "VMware", "2024"},
    {"VMware Certified Professional — Data Center Virtualization", "VMware", "2022"},
    {"VMware Certified Professional — Application Modernization", "VMware", "2022"},
    {"VMware vSphere with Tanzu Specialist", "VMware", "2022"}
  ]

  def template(assigns) do
    assigns =
      Map.merge(assigns, %{
        nav: @nav,
        jobs: @jobs,
        projects: @projects,
        skills: @skills,
        certifications: @certifications
      })

    ~H"""
    <div class="mx-auto min-h-screen max-w-6xl px-6 sm:px-10 lg:flex lg:justify-between lg:gap-16 lg:px-12">
      <%!-- ───────────── Sidebar: who, what, where to go ───────────── --%>
      <header class="pt-16 sm:pt-20 lg:sticky lg:top-0 lg:flex lg:h-screen lg:w-[42%] lg:flex-col lg:justify-between lg:py-24">
        <div>
          <img src="/images/hs.jpg" alt="Héctor Salinas" class="avatar size-16 sm:size-20" />
          <h1 class="name mt-7">Héctor Salinas</h1>
          <p class="pp-title-large mt-3 text-pp-primary">Staff Platform Engineer</p>
          <p class="pp-body-large mt-4 max-w-sm text-pp-on-surface-variant text-pretty">
            OpenShift, Kubernetes and enterprise Linux at scale, from architecture to production.
          </p>
          <p class="pp-body-medium mt-4 flex items-center gap-1.5 text-pp-on-surface-variant">
            <span class="status-dot" aria-hidden="true"></span> Monterrey, México
          </p>

          <nav class="mt-16 hidden lg:block" aria-label="Sections">
            <ul class="space-y-1">
              <li :for={{id, label} <- @nav}>
                <a href={"#" <> id} data-nav={id} class="nav-link">
                  <span class="nav-line" aria-hidden="true"></span>
                  <span>{label}</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>

        <div class="mt-10 flex flex-wrap items-center gap-x-3 gap-y-4 lg:mt-0">
          <.pp_button href={"mailto:" <> email()} id="cta-contact">
            <:start_icon><.pp_icon name="hero-envelope" /></:start_icon>
            Get in touch
          </.pp_button>
          <.pp_icon_button href={github()} label="GitHub" target="_blank" rel="noopener">
            <.github_mark />
          </.pp_icon_button>
          <.pp_icon_button
            href={credly()}
            label="Credly certifications"
            icon="hero-check-badge"
            target="_blank"
            rel="noopener"
          />
          <span class="mx-1 hidden h-6 w-px bg-pp-outline-variant sm:block" aria-hidden="true"></span>
          <.pp_theme_toggle />
        </div>
      </header>

      <%!-- ───────────── Content ───────────── --%>
      <main id="content" class="pb-16 pt-20 lg:w-[58%] lg:py-24">
        <.section id="about" title="About">
          <div class="prose-body space-y-4">
            <p>
              I've spent 10+ years across enterprise Linux, Kubernetes, VMware and software
              engineering. Today I design hybrid cloud platforms on <strong>OpenShift</strong>, lead
              <strong>VMware-to-Kubernetes migrations</strong>
              (120+ VMs into OpenShift Virtualization so far), and run Linux operations for critical
              production infrastructure.
            </p>
            <p>
              I'm usually the escalation point when something deep in the stack breaks, working
              alongside Red Hat TAMs, architects and support engineering. Sometimes that means reading
              upstream source and shipping a patched controller image before the official fix lands.
            </p>
            <p>
              Before infrastructure I was a software engineer, and I still write a lot of code: lately
              <a href="https://guiltty.dev" class="inline-link" target="_blank" rel="noopener">a terminal emulator</a>
              and
              <a href="https://phoenixpaper.dev" class="inline-link" target="_blank" rel="noopener">a Material Design library</a>
              for Phoenix.
            </p>
          </div>
        </.section>

        <.section id="experience" title="Experience">
          <ol class="item-list">
            <li :for={job <- @jobs} class="item">
              <p class="item-meta">{job.period}</p>
              <div>
                <h3 class="pp-title-medium">
                  {job.role} <span class="text-pp-on-surface-variant">· {job.org}</span>
                </h3>
                <p class="item-body">{job.body}</p>
                <.tags tags={job.tags} class="mt-3" />
              </div>
            </li>
          </ol>
        </.section>

        <.section id="projects" title="Projects">
          <ul class="item-list">
            <li :for={project <- @projects}>
              <a href={project.href} target="_blank" rel="noopener" class="item item-link group">
                <span class="project-mark">
                  <%= if project[:mark] do %>
                    <img src={project.mark} alt="" class="size-6" />
                  <% else %>
                    <.pp_icon name={project.icon} size="none" class="size-5" />
                  <% end %>
                </span>
                <div>
                  <h3 class="pp-title-medium flex items-center gap-1">
                    <span class="item-title">{project.name}</span>
                    <.pp_icon name="hero-arrow-up-right-micro" size="none" class="item-arrow size-4" />
                  </h3>
                  <p class="pp-label-medium text-pp-on-surface-variant">{project.host}</p>
                  <p class="item-body">{project.body}</p>
                  <.tags tags={project.tags} class="mt-3" />
                </div>
              </a>
            </li>
          </ul>
          <a href={github()} target="_blank" rel="noopener" class="more-link mt-8">
            Everything else on GitHub
            <.pp_icon name="hero-arrow-right-micro" size="none" class="size-4" />
          </a>
        </.section>

        <.section id="skills" title="Skills">
          <dl class="divide-y divide-pp-outline-variant/60">
            <div
              :for={{group, items} <- @skills}
              class="grid gap-1 py-4 sm:grid-cols-[8rem_1fr] sm:gap-6"
            >
              <dt class="item-meta pt-0.5">{group}</dt>
              <dd class="pp-body-large text-pp-on-surface">{Enum.join(items, " · ")}</dd>
            </div>
          </dl>
        </.section>

        <.section id="certifications" title="Certifications">
          <ul class="divide-y divide-pp-outline-variant/60">
            <li :for={{name, issuer, year} <- @certifications} class="flex items-baseline gap-4 py-4">
              <div class="min-w-0 flex-1">
                <p class="pp-body-large">{name}</p>
                <p class="pp-body-medium text-pp-on-surface-variant">{issuer}</p>
              </div>
              <span class="item-meta tabular-nums">{year}</span>
            </li>
          </ul>
          <a href={credly()} target="_blank" rel="noopener" class="more-link mt-8">
            Verify on Credly <.pp_icon name="hero-arrow-right-micro" size="none" class="size-4" />
          </a>
        </.section>

        <footer class="pp-body-small mt-24 max-w-md text-pp-on-surface-variant">
          Built with
          <a
            href="https://github.com/elixir-tools/tableau"
            class="inline-link"
            target="_blank"
            rel="noopener"
          >Tableau</a>
          and <a href="https://phoenixpaper.dev" class="inline-link" target="_blank" rel="noopener">PhoenixPaper</a>, set in Roboto Flex.
          © {Date.utc_today().year} Héctor Salinas.
        </footer>
      </main>
    </div>
    """
  end
end
