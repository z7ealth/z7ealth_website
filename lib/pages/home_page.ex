defmodule Z7ealthWebsite.HomePage do
  use Tableau.Page,
    layout: Z7ealthWebsite.RootLayout,
    permalink: "/"

  use Phoenix.Component
  use PhoenixPaper.Components

  import Z7ealthWebsite.Components

  @stats [
    {"10+", "years in infrastructure & software"},
    {"120+", "VMs moved to OpenShift Virtualization"},
    {"8", "industry certifications"},
    {"5", "open-source projects"}
  ]

  @focus [
    %{
      icon: "hero-cube-transparent",
      title: "Platform Engineering",
      subtitle: "OpenShift, Kubernetes & hybrid cloud",
      body:
        "I design and operate enterprise OpenShift and Kubernetes platforms, including KubeVirt/OpenShift Virtualization, large-scale VMware-to-Kubernetes migrations, and storage integrations. I'm the escalation point for complex platform issues, working directly with Red Hat TAMs and support engineering."
    },
    %{
      icon: "hero-server-stack",
      title: "Enterprise Linux Operations",
      subtitle: "RHEL, governance & hardening at scale",
      body:
        "I lead enterprise Linux operations across critical production infrastructure: centralized patch management with Red Hat Satellite, identity with Red Hat IdM, SELinux and system hardening, and RHEL upgrade programs at scale."
    },
    %{
      icon: "hero-command-line",
      title: "Automation & Software",
      subtitle: "IaC, CI/CD & full-stack development",
      body:
        "I automate infrastructure with Ansible and codify operational practice so environments are repeatable. A software background in Elixir/Phoenix, Go and TypeScript keeps me close to the developer experience of the platforms I build."
    }
  ]

  @jobs [
    %{
      period: "2025 – Present",
      role: "OpenShift Architect / Platform Engineer",
      org: "OXXO",
      current: true,
      body:
        "Designed and implemented enterprise OpenShift infrastructure across the Monterrey and Querétaro data centers. Led the migration of 120+ VMware virtual machines into OpenShift Virtualization, built a custom Forklift controller image to unblock production ahead of an official upstream fix, and implemented the Dell PowerMax CSI integration later referenced by Dell engineering teams.",
      tags: ["OpenShift", "OpenShift Virtualization", "Forklift/MTV", "Dell PowerMax CSI"]
    },
    %{
      period: "2025 – Present · concurrent",
      role: "Linux Platform Manager",
      org: "The Home Depot México",
      current: true,
      body:
        "Lead enterprise Linux platform operations and governance across critical production infrastructure. Implemented Red Hat Satellite 6.16 for centralized patch management and content lifecycle, and manage Red Hat IdM, Ansible automation, Linux hardening, and RHEL upgrade programs.",
      tags: ["RHEL", "Satellite 6.16", "Red Hat IdM", "Ansible"]
    },
    %{
      period: "2022 – 2024",
      role: "Cloud Architect",
      org: "OXXO",
      current: false,
      body:
        "Designed cloud architectures for enterprise modernization initiatives and led the technical migration of Java monoliths toward cloud-native microservices, partnering with development and infrastructure teams on architecture and governance.",
      tags: ["Azure", "Tanzu", "Microservices"]
    },
    %{
      period: "2021 – 2022",
      role: "Linux System Administrator",
      org: "The Home Depot México",
      current: false,
      body:
        "Administered Red Hat Enterprise Linux environments supporting enterprise production workloads, resolving infrastructure incidents and handling OS maintenance, patching, and troubleshooting.",
      tags: ["RHEL", "Patching", "Troubleshooting"]
    },
    %{
      period: "2016 – 2021",
      role: "Software Engineering",
      org:
        "Daltum Systems · Inmar Winston Data · Osiris HealthTech Systems · Concéntrico · NHPSoft",
      current: false,
      body:
        "Full-stack and backend development roles building web applications, before moving into platform and infrastructure engineering.",
      tags: ["Full stack", "Backend"]
    }
  ]

  @skills [
    {"hero-cube", "Platform & Orchestration",
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
    {"hero-server", "Enterprise Linux",
     ["RHEL 7/8/9", "Red Hat Satellite", "Red Hat IdM", "Ansible"]},
    {"hero-cloud", "Virtualization & Infrastructure",
     ["VMware vSphere 8", "Tanzu", "Microsoft Azure"]},
    {"hero-circle-stack", "Storage & Data",
     ["OpenShift Data Foundation (Ceph)", "Dell PowerMax CSI", "CDI / StorageProfiles"]},
    {"hero-chart-bar", "Observability & Reliability", ["Prometheus", "Alertmanager", "Grafana"]},
    {"hero-code-bracket", "Development",
     [
       "Elixir / Phoenix",
       "Go",
       "C",
       "TypeScript",
       "JavaScript",
       "Node.js",
       "React",
       "Vue.js",
       "Bash"
     ]}
  ]

  @certifications [
    {"Red Hat Certified System Administrator", "RHCSA · EX200", "Red Hat", "2026"},
    {"Red Hat Certified OpenShift Administrator", "EX280", "Red Hat", "2026"},
    {"Certified Kubernetes Administrator", "CKA", "CNCF", "2024"},
    {"Azure Administrator Associate", "AZ-104", "Microsoft", "2024"},
    {"VMware Certified Master Specialist", "Cloud Native", "VMware", "2024"},
    {"VMware Certified Professional", "Data Center Virtualization", "VMware", "2022"},
    {"VMware Certified Professional", "Application Modernization", "VMware", "2022"},
    {"VMware vSphere with Tanzu Specialist", "Tanzu", "VMware", "2022"}
  ]

  @projects [
    %{
      id: "guiltty",
      name: "guiltty",
      mark: "/images/projects/guiltty.svg",
      tagline: "A GPU-accelerated terminal emulator in Elixir and C",
      body:
        "Every tab is a supervised process tree and the renderer is its own OS process, so when a part crashes its supervisor restarts it and your tabs stay. Vulkan 1.3 with an OpenGL fallback, lockable tabs, safe broadcast input, ligatures and color emoji, and a live config written in plain Elixir.",
      tags: ["Elixir", "C", "Vulkan", "OpenGL", "Linux"],
      site: "https://guiltty.dev",
      repo: "https://github.com/z7ealth/guiltty",
      wide: true
    },
    %{
      id: "phoenixpaper",
      name: "PhoenixPaper",
      mark: "/images/projects/phoenixpaper.svg",
      tagline: "Material Design 3 for Phoenix",
      body:
        "A Material Design 3 (and M3 Expressive) component library for Phoenix and LiveView, in the spirit of ember-paper, styled with Tailwind CSS. This site is built with it.",
      tags: ["Elixir", "Phoenix", "LiveView", "Tailwind"],
      site: "https://phoenixpaper.dev",
      repo: "https://github.com/z7ealth/phoenix_paper",
      wide: false
    },
    %{
      id: "kubevirt-tools",
      name: "kubevirt-tools",
      icon: "hero-squares-2x2",
      tagline: "RVTools-inspired inventory for KubeVirt",
      body:
        "Inventory, visibility and assessment for KubeVirt / OpenShift Virtualization environments: the RVTools experience for Kubernetes-native virtualization.",
      tags: ["KubeVirt", "OpenShift"],
      site: nil,
      repo: "https://github.com/z7ealth",
      wide: false
    },
    %{
      id: "extop",
      name: "extop",
      icon: "hero-cpu-chip",
      tagline: "A terminal system monitor on the BEAM",
      body:
        "A system monitor for Linux written in Elixir, in the spirit of btop, with a ratatui-based TUI.",
      tags: ["Elixir", "TUI", "Linux"],
      site: nil,
      repo: "https://github.com/z7ealth/extop",
      wide: false
    },
    %{
      id: "exkl",
      name: "EXKL",
      icon: "hero-fire",
      tagline: "An open Linux service for DeepCool AK coolers",
      body:
        "An open-source Linux alternative to DeepCool's proprietary software, with monitoring and display support for AK-series digital coolers. Built with Elixir, Phoenix and LiveView.",
      tags: ["Elixir", "Phoenix", "LiveView"],
      site: nil,
      repo: "https://github.com/z7ealth/exkl",
      wide: false
    }
  ]

  # The hero's profile card.
  @current_roles [
    {"hero-cube-transparent", "OpenShift Architect", "OXXO"},
    {"hero-server-stack", "Linux Platform Manager", "The Home Depot México"}
  ]

  @headline_certs ["RHCSA", "EX280", "CKA", "AZ-104"]

  def template(assigns) do
    assigns =
      Map.merge(assigns, %{
        stats: @stats,
        focus: @focus,
        jobs: @jobs,
        skills: @skills,
        certifications: @certifications,
        projects: @projects,
        current_roles: @current_roles,
        headline_certs: @headline_certs
      })

    ~H"""
    <%!-- ───────────────────────── Hero ───────────────────────── --%>
    <section id="hero" class="relative overflow-hidden">
      <div class="hero-grid" aria-hidden="true"></div>
      <div class="hero-glow hero-glow-1" aria-hidden="true"></div>
      <div class="hero-glow hero-glow-2" aria-hidden="true"></div>

      <div class="relative mx-auto grid max-w-6xl gap-14 px-6 pt-14 pb-20 sm:pt-20 lg:grid-cols-[1.15fr_1fr] lg:items-center lg:pb-28 [&>*]:min-w-0">
        <div>
          <a
            href="https://guiltty.dev"
            target="_blank"
            rel="noopener"
            class="hero-pill pp-label-large"
            id="hero-release"
          >
            <span class="shrink-0 rounded-pp-full bg-pp-primary px-2 py-0.5 text-pp-on-primary pp-label-medium">
              New
            </span>
            <span class="truncate">guiltty: a GPU terminal in Elixir and C</span>
            <.pp_icon name="hero-arrow-right-micro" size="none" class="size-4 shrink-0" />
          </a>

          <h1 class="hero-title mt-8 text-balance">
            Staff Platform Engineer.<br />
            <span class="hero-title-accent">OpenShift &amp; Linux at scale.</span>
          </h1>

          <p class="pp-body-large sm:text-xl! sm:leading-8! mt-6 max-w-xl text-pp-on-surface-variant text-pretty">
            10+ years across enterprise Linux, Kubernetes/OpenShift, VMware and software engineering.
            I build hybrid cloud platforms, migrate VMware estates into OpenShift Virtualization, and
            write open source in Elixir and C.
          </p>

          <.pp_button_group size="md" class="mt-10 flex-wrap">
            <.pp_button href={"mailto:" <> email()} size="md" id="cta-contact">
              <:start_icon><.pp_icon name="hero-envelope" /></:start_icon>
              Get in touch
            </.pp_button>
            <.pp_button
              href={github()}
              target="_blank"
              rel="noopener"
              variant="outlined"
              size="md"
              id="cta-github"
            >
              <:start_icon><.github_mark class="size-5" /></:start_icon>
              View GitHub
            </.pp_button>
          </.pp_button_group>
        </div>

        <div class="hero-card-wrap">
          <.pp_card variant="elevated" class="hero-card" id="hero-profile">
            <div class="flex items-center gap-5">
              <img src="/images/hs.jpg" alt="Héctor Salinas" class="hero-avatar size-20 sm:size-24" />
              <div class="min-w-0">
                <p class="pp-headline-small">Héctor Salinas</p>
                <p class="pp-title-small text-pp-primary">Staff Platform Engineer</p>
                <p class="pp-body-medium mt-1 flex items-center gap-1 text-pp-on-surface-variant">
                  <.pp_icon name="hero-map-pin-micro" size="none" class="size-4" /> Monterrey, México
                </p>
              </div>
            </div>

            <.pp_divider class="my-6" />

            <p class="pp-label-medium uppercase tracking-widest text-pp-on-surface-variant">
              Currently
            </p>
            <ul class="mt-3 space-y-3">
              <li :for={{icon, role, org} <- @current_roles} class="flex items-center gap-3">
                <span class="hero-card-icon">
                  <.pp_icon name={icon} size="none" class="size-5" />
                </span>
                <span class="min-w-0">
                  <span class="pp-title-small block">{role}</span>
                  <span class="pp-body-small block text-pp-on-surface-variant">{org}</span>
                </span>
              </li>
            </ul>

            <p class="pp-label-medium mt-6 uppercase tracking-widest text-pp-on-surface-variant">
              Certified
            </p>
            <div class="mt-3 flex flex-wrap gap-2">
              <.pp_chip :for={cert <- @headline_certs} variant="input">
                <:icon><.pp_icon name="hero-check-badge-micro" size="none" class="size-4" /></:icon>
                {cert}
              </.pp_chip>
            </div>

            <p class="pp-label-medium mt-6 uppercase tracking-widest text-pp-on-surface-variant">
              Building
            </p>
            <div class="mt-3 grid grid-cols-2 gap-2">
              <a href="https://guiltty.dev" target="_blank" rel="noopener" class="hero-card-link">
                <img src="/images/projects/guiltty.svg" alt="" class="size-5" />
                <span>guiltty</span>
              </a>
              <a href="https://phoenixpaper.dev" target="_blank" rel="noopener" class="hero-card-link">
                <img src="/images/projects/phoenixpaper.svg" alt="" class="size-5" />
                <span>PhoenixPaper</span>
              </a>
            </div>
          </.pp_card>
        </div>
      </div>
    </section>

    <%!-- ───────────────────────── Stats ───────────────────────── --%>
    <section class="border-y border-pp-outline-variant bg-pp-surface-container-low">
      <dl class="mx-auto grid max-w-6xl grid-cols-2 gap-px px-6 md:grid-cols-4">
        <div :for={{value, label} <- @stats} class="py-8 text-center">
          <dt class="sr-only">{label}</dt>
          <dd class="pp-display-small-emphasized text-pp-primary">{value}</dd>
          <dd class="pp-body-medium mt-1 text-pp-on-surface-variant">{label}</dd>
        </div>
      </dl>
    </section>

    <%!-- ───────────────────────── About & focus ───────────────────────── --%>
    <section id="about" class="mx-auto max-w-6xl px-6 py-24 sm:py-32">
      <.section_header eyebrow="About me" title="Platforms that hold up under real load.">
        I lead modernization initiatives, enterprise Linux operations and VMware-to-Kubernetes
        migrations, and work regularly with Red Hat TAMs, architects and support engineering on
        critical infrastructure escalations. When something deep in the stack breaks, I'm usually
        the one reading the source to find out why.
      </.section_header>

      <div class="bento mt-14">
        <.pp_card :for={area <- @focus} variant="filled" class="feature-card">
          <div class="feature-icon">
            <.pp_icon name={area.icon} size="none" class="size-6" />
          </div>
          <h3 class="pp-title-large mt-5">{area.title}</h3>
          <p class="pp-label-large mt-1 text-pp-primary">{area.subtitle}</p>
          <p class="pp-body-medium mt-3 text-pp-on-surface-variant">{area.body}</p>
        </.pp_card>
      </div>
    </section>

    <%!-- ───────────────────────── Experience ───────────────────────── --%>
    <section id="experience" class="border-y border-pp-outline-variant bg-pp-surface-container-lowest">
      <div class="mx-auto grid max-w-6xl grid-cols-1 gap-12 px-6 py-24 sm:py-32 lg:grid-cols-[1fr_1.5fr] lg:items-start [&>*]:min-w-0">
        <div class="lg:sticky lg:top-28">
          <.section_header eyebrow="Experience" title="From sysadmin to platform architect.">
            Five years writing software, then the move into infrastructure: Linux first, then cloud,
            then OpenShift at enterprise scale.
          </.section_header>
        </div>

        <ol class="timeline">
          <li :for={job <- @jobs} class={["timeline-item", job.current && "is-current"]}>
            <span class="timeline-dot" aria-hidden="true"></span>
            <.pp_card variant="outlined" class="feature-card">
              <p class="pp-label-large text-pp-primary">{job.period}</p>
              <h3 class="pp-title-large mt-1">{job.role}</h3>
              <p class="pp-title-small text-pp-on-surface-variant">{job.org}</p>
              <p class="pp-body-medium mt-3 text-pp-on-surface-variant">{job.body}</p>
              <div class="mt-4 flex flex-wrap gap-2">
                <.pp_chip :for={tag <- job.tags} variant="input">{tag}</.pp_chip>
              </div>
            </.pp_card>
          </li>
        </ol>
      </div>
    </section>

    <%!-- ───────────────────────── Skills ───────────────────────── --%>
    <section id="skills" class="mx-auto max-w-6xl px-6 py-24 sm:py-32">
      <.section_header eyebrow="Technical skills" title="The stack I work in every day.">
        From bare metal and hypervisors up through Kubernetes operators to the application code
        running on top.
      </.section_header>

      <div class="bento mt-14">
        <.pp_card :for={{icon, title, skills} <- @skills} variant="filled" class="feature-card">
          <div class="flex items-center gap-4">
            <div class="feature-icon">
              <.pp_icon name={icon} size="none" class="size-6" />
            </div>
            <h3 class="pp-title-large">{title}</h3>
          </div>
          <div class="mt-5 flex flex-wrap gap-2">
            <.pp_chip :for={skill <- skills} variant="input">{skill}</.pp_chip>
          </div>
        </.pp_card>
      </div>
    </section>

    <%!-- ───────────────────────── Certifications ───────────────────────── --%>
    <section
      id="certifications"
      class="border-y border-pp-outline-variant bg-pp-surface-container-lowest"
    >
      <div class="mx-auto max-w-6xl px-6 py-24 sm:py-32">
        <div class="flex flex-col gap-6 md:flex-row md:items-end md:justify-between">
          <.section_header eyebrow="Certifications" title="Verified, not just claimed." />
          <.pp_button
            href={credly()}
            target="_blank"
            rel="noopener"
            variant="tonal"
            class="shrink-0 self-start md:self-auto"
          >
            <:start_icon><.pp_icon name="hero-check-badge" /></:start_icon>
            Verify on Credly
          </.pp_button>
        </div>

        <ul class="mt-14 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <li :for={{name, detail, issuer, year} <- @certifications}>
            <.pp_card variant="outlined" class="feature-card">
              <div class="flex items-start justify-between gap-3">
                <div class="feature-icon">
                  <.pp_icon name="hero-check-badge" size="none" class="size-6" />
                </div>
                <span class="rounded-pp-full bg-pp-secondary-container px-2.5 py-0.5 text-pp-on-secondary-container pp-label-medium">
                  {year}
                </span>
              </div>
              <p class="pp-label-medium mt-5 uppercase tracking-widest text-pp-on-surface-variant">
                {issuer}
              </p>
              <h3 class="pp-title-medium mt-1 text-balance">{name}</h3>
              <p class="pp-body-medium mt-1 text-pp-primary">{detail}</p>
            </.pp_card>
          </li>
        </ul>
      </div>
    </section>

    <%!-- ───────────────────────── Projects ───────────────────────── --%>
    <section id="projects" class="mx-auto max-w-6xl px-6 py-24 sm:py-32">
      <.section_header eyebrow="Open source & personal projects" title="Things I build after hours.">
        Mostly Elixir, sometimes C: tools for the platforms I run at work, and a few that exist
        because I wanted to see if the BEAM could do it.
      </.section_header>

      <div class="bento mt-14">
        <.pp_card
          :for={project <- @projects}
          id={"project-#{project.id}"}
          variant="filled"
          class={["feature-card", project.wide && "bento-wide"]}
          content_class="flex h-full flex-col"
        >
          <div class="flex items-center gap-4">
            <span class="project-mark">
              <%= if project[:mark] do %>
                <img src={project.mark} alt="" class="size-7" />
              <% else %>
                <.pp_icon name={project.icon} size="none" class="size-6" />
              <% end %>
            </span>
            <div class="min-w-0">
              <h3 class={[project.wide && "pp-headline-small", !project.wide && "pp-title-large"]}>
                {project.name}
              </h3>
              <p class="pp-label-large text-pp-primary">{project.tagline}</p>
            </div>
          </div>
          <p class="pp-body-medium mt-4 text-pp-on-surface-variant">{project.body}</p>
          <div class="mt-4 flex flex-wrap gap-2">
            <.pp_chip :for={tag <- project.tags} variant="input">{tag}</.pp_chip>
          </div>
          <div class="mt-auto flex flex-wrap gap-2 pt-6">
            <.pp_button
              :if={project.site}
              href={project.site}
              target="_blank"
              rel="noopener"
              variant="tonal"
            >
              <:start_icon><.pp_icon name="hero-globe-alt" /></:start_icon>
              {URI.parse(project.site).host}
            </.pp_button>
            <.pp_button href={project.repo} target="_blank" rel="noopener" variant="text">
              <:start_icon><.github_mark class="size-4.5" /></:start_icon>
              Source
            </.pp_button>
          </div>
        </.pp_card>
      </div>
    </section>

    <%!-- ───────────────────────── Contact ───────────────────────── --%>
    <section id="contact" class="mx-auto max-w-6xl px-6 pb-24 sm:pb-32">
      <div class="contact-panel px-6 py-14 sm:px-14 sm:py-16 text-center">
        <.pp_typography
          variant="label-large"
          color="primary"
          tag="p"
          class="uppercase tracking-[0.2em]"
        >
          Contact
        </.pp_typography>
        <.pp_typography variant="display-small" emphasized tag="h2" class="mt-3 text-balance">
          Have a platform that needs untangling?
        </.pp_typography>
        <.pp_typography
          variant="body-large"
          color="on-surface-variant"
          class="mx-auto mt-4 max-w-xl text-pretty"
        >
          OpenShift, virtualization migrations, enterprise Linux or Elixir: I'm happy to talk.
        </.pp_typography>
        <.pp_button_group size="md" class="mt-8 flex-wrap justify-center">
          <.pp_button href={"mailto:" <> email()} size="md">
            <:start_icon><.pp_icon name="hero-envelope" /></:start_icon>
            {email()}
          </.pp_button>
        </.pp_button_group>
      </div>
    </section>
    """
  end
end
