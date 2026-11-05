// The site is static (Tableau), so there's no LiveView server. A LiveSocket
// with no LiveViews on the page runs in "dead view" mode: it never opens a
// websocket, but it still executes Phoenix.LiveView.JS commands (the mobile
// nav side sheet) and mounts PhoenixPaper's hook (the top app bar's
// scrolled-under color in browsers without scroll-driven animations).
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import PhoenixPaperHooks from "phoenix_paper"

const liveSocket = new LiveSocket("/live", Socket, {hooks: {...PhoenixPaperHooks}})
liveSocket.connect()
