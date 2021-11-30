-- colors for active , inactive buffer tabs
require "bufferline".setup {
    options = {
        separator_style = {'', ''},
        tab_size = 22,
        enforce_regular_tabs = true,
        show_buffer_close_icons = false,
        -- Offset the bufferline when we have nvim tree open
        offsets = {
          {
            filetype = "NvimTree",
            text = "Files",
            highlight = "Directory",
            text_align = "left"
          }
        }
    },
}
