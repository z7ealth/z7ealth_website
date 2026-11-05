// Scroll spy for the sidebar nav: marks the link of the section in view
// with aria-current, which the CSS turns into the longer, colored line.
const links = [...document.querySelectorAll("[data-nav]")]
const byId = new Map(links.map((link) => [link.dataset.nav, link]))

const setActive = (id) => {
  for (const [key, link] of byId) {
    if (key === id) link.setAttribute("aria-current", "true")
    else link.removeAttribute("aria-current")
  }
}

if (links.length && "IntersectionObserver" in window) {
  const observer = new IntersectionObserver(
    (entries) => {
      for (const entry of entries) {
        if (entry.isIntersecting) setActive(entry.target.id)
      }
    },
    // A thin band a third of the way down the viewport.
    {rootMargin: "-33% 0px -66% 0px"},
  )

  for (const id of byId.keys()) {
    const section = document.getElementById(id)
    if (section) observer.observe(section)
  }
}
