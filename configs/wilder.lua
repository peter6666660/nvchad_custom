-- config goes here
local wilder = require "wilder"

wilder.set_option(
  "renderer",
  wilder.renderer_mux {
    [":"] = wilder.popupmenu_renderer(wilder.popupmenu_palette_theme {
      border = "rounded",
      max_height = "75%", -- max height of the palette
      min_height = 0, -- set to the same as 'max_height' for a fixed height window
      prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
      reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
      highlighter = wilder.basic_highlighter(),
      highlights = {
        accent = wilder.make_hl("WilderAccent", "Pmenu", { {}, {}, { foreground = "#884dff" } }),
        selected = wilder.make_hl("WilderAccent", "PmenuSel", { {}, {}, { foreground = "#884dff" } }),
      },
      left = { " ", wilder.popupmenu_devicons() },
      right = { " ", wilder.popupmenu_scrollbar() },
    }),
    ["/"] = wilder.wildmenu_renderer {
      highlighter = wilder.basic_highlighter(),
      highlights = {
        accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#884dff" } }),
        selected = wilder.make_hl("WilderAccent", "PmenuSel", { {}, {}, { foreground = "#884dff" } }),
      },
    },
  }
)
wilder.setup { modes = { ":", "/", "?" } }
