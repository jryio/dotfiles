----------------------------------------------------------------
--[[
lvim is the global options object

Linters should be filled in as strings
with either a global executable
or a path to an executable
--]]
----------------------------------------------------------------

----------------------------------------------------------------
-- GENERAL
----------------------------------------------------------------
lvim.log.level = "info"
lvim.format_on_save = true
-- We need have a colorscheme name here otherwise onedarker gets loaded by
-- default by LunarVim. We add a file in the vim runtimepath under
-- ~/.config/lvim/colors/tomorrow-night.vim to register the name and
-- simultaneously disbale onedarker.
lvim.colorscheme = "tomorrow-night"

----------------------------------------------------------------
-- KEYMAPS -> [view all the defaults by pressing <leader>Lk]
----------------------------------------------------------------
lvim.leader = "space"
local comma = ","
local CR = "<CR>"

-- INSERT
lvim.keys.insert_mode = {
  -- Unmap arrows
  ["<up>"    ] = "<NOP>",
  ["<down>"  ] = "<NOP>",
  ["<left>"  ] = "<NOP>",
  ["<right>" ] = "<NOP>",
  ["<F1>"] = "<NOP>",
  -- Unmap defaults
  ["<A-Down>"] = "",
  ["<A-Left>"] = "",
  ["<A-Right>"] = "",
  ["<A-Up>"] = "",
  ["<A-j>"] = "",
  ["<A-k>"] = "",
  ["<p>"] = "",
  ["jj"] = "",
  ["jk"] = "",
  ["kj"] = "",
}

-- NORMAL
lvim.keys.normal_mode = {
  -- Navigate buffers
  ["+"] = ":bnext<CR>",
  ["_"] = ":bprevious<CR>",
  -- Save buffer
  [comma.."s"] = ":w"..CR,
  -- Close buffer
  [comma.."w"] = ":Sayonara!<CR>",
  [comma.."q"] = ":Sayonara<CR>",
  -- Resizes
  ["<M-l>"] = "10<C-w>>",
  ["<M-h>"] = "10<C-w><",
  ["<M-j>"] = "10<C-w>-",
  ["<M-k>"] = "10<C-w>+",
  -- Easier window switching
  ["<C-h>"] = "<C-w>h",
  ["<C-j>"] = "<C-w>j",
  ["<C-k>"] = "<C-w>k",
  ["<C-l>"] = "<C-w>l",
  -- Visual linewise up and down by default (and use gj gk to go quicker)
  ["j" ] = "gj",
  ["k" ] = "gk",
  ["gj"] = "5j",
  ["gk"] = "5k",
  -- Center screen when navigating in visual mode
  ["n"] = ":norm! nzz<CR>",
  ["N"] = ":norm! Nzz<CR>",
  -- Disbaled due to neoscroll
  -- ["<C-u>"] = "<C-u>zz",
  -- ["<C-d>"] = "<C-d>zz",
  -- ["<C-f>"] = "<C-f>zz",
  -- ["<C-b>"] = "<C-b>zz",
  -- Remap H and L (top, bottom of screen to left and right end of line)
  ["<S-h>"] = "^",
  ["<S-l>"] = "$",

  -- More logical Y (default was alias for yy)
  ["Y"] = "y$",
  -- Don't yank to default register when changing something
  ["c"] = "<NOP>",
  -- Navigate Diagnostics
  ["[q"] = ":cprev<CR>",
  ["]q"] = ":cnext<CR>",
  -- After block yank and paste, move cursor to the end of operated text and don't override register
  ["p"] = "p`]",
  -- Fix dw at the end of line bug default vim has special treatment (:help dw)
  ["dw"] = "de",
  -- Keep the cursor in place while joining lines
  ["J"] = "mzJ`z",
  -- [S]plit line (sister to [J]oin lines) S is covered by cc.
  ["S"] = "mzi<CR><ESC>`z",

  -- Unmap default resizes
  ["<A-Down>"]   = "",
  ["<A-Left>"]   = "",
  ["<A-Right>"]  = "",
  ["<A-Up>"]     = "",
  ["<A-j>"]      = "",
  ["<A-k>"]      = "",
  ["<C-Down>"]   = "",
  ["<C-Left>"]   = "",
  ["<C-Right>"]  = "",
  ["<C-Up>"]     = "",
  -- Unmap
  ["<up>"    ] = "<NOP>",
  ["<down>"  ] = "<NOP>",
  ["<left>"  ] = "<NOP>",
  ["<right>" ] = "<NOP>",
  ["<bs>"    ] = "<NOP>",
  ["<delete>"] = "<NOP>",
  ["<F1>"] = "<NOP>",
  ["Q"   ] = "<NOP>",
  ["q"   ] = "<NOP>", -- Unmap macro recording
  -- Unmap default comment behavior
  -- ["<C-q>"] = ":call QuickFixToggle()<CR>",
}

lvim.keys.visual_mode = {
  -- Visual linewise up and down by default (and use gj gk to go quicker)
  ["j" ] = "gj",
  ["k" ] = "gk",
  ["gj"] = "5j",
  ["gk"] = "5k",
  -- Center screen when navigating in visual mode
  ["n"] = ":norm! nzz<CR>",
  ["N"] = ":norm! Nzz<CR>",
  -- Disbaled due to neoscroll
  -- ["<C-u>"] = "<C-u>zz",
  -- ["<C-d>"] = "<C-d>zz",
  -- ["<C-f>"] = "<C-f>zz",
  -- ["<C-b>"] = "<C-b>zz",
  -- Remap H and L (top, bottom of screen to left and right end of line)
  ["H"] = "^",
  ["L"] = "$",
  -- After block yank and paste, move cursor to the end of operated text and don't override register
  ["y"] = "y`]",
  ["p"] = '"_dP`]',
  -- Move visual block
  ["J"] =  ":m '>+1<CR>gv=gv",
  ["K"] = ":m '<-2<CR>gv=gv",
  -- Replace visual selection
  ["<C-r>"] = '"hy:%s/<C-r>h//gc<left><left><left>',
  -- Faster sort
  ["<leader>s"] =  ":!sort<CR>",
}

-- Use CamelCaseMotion instead of default motions
vim.cmd [[
  map <silent> w <Plug>CamelCaseMotion_w
  map <silent> b <Plug>CamelCaseMotion_b
  map <silent> e <Plug>CamelCaseMotion_e
  map <silent> ge <Plug>CamelCaseMotion_ge
]]

----------------------------------------------------------------
-- TELESCOPE
----------------------------------------------------------------
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

----------------------------------------------------------------
-- BUILTIN PLUGINS
----------------------------------------------------------------
-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true

lvim.builtin.terminal.active = true

lvim.builtin.comment.active = true

lvim.builtin.nvimtree.setup.view.width = 30
lvim.builtin.nvimtree.setup.auto_close = false
lvim.builtin.nvimtree.setup.view.auto_resize = false
lvim.builtin.nvimtree.hide_dotfiles = false
lvim.builtin.nvimtree.on_config_done = function ()
  lvim.builtin.nvimtree.setup.view.width = 30
  lvim.builtin.nvimtree.setup.auto_close = false
  lvim.builtin.nvimtree.setup.view.auto_resize = false
  lvim.builtin.nvimtree.hide_dotfiles = false

end

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.theme = "jellybeans"

----------------------------------------------------------------
-- WHICHKEY
----------------------------------------------------------------
-- No Highlight
lvim.builtin.which_key.mappings["h"] = {
  -- Clear search hilights but also clear the previous search term
  "<cmd>let @/ = '' | nohlsearch<CR>",
  "No Highlight"
}

-- nvimtree
lvim.builtin.which_key.mappings["e"] = {}
lvim.builtin.which_key.mappings["n"] = {
  name = "+NvimTree",
  f =  { "<cmd>lua require('core.utils').find_toggle()<CR>", "Minimap"}
  -- ^ close minimap before opening nvimtree to prevent nvimtree from resizing
}

-- Code minimap
lvim.builtin.which_key.mappings["m"] = {
  name = "+Minimap",
  m = { "<cmd>MinimapToggle<CR>", "Minimap Toggle"}
}

-- Symbols outline
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<CR>", "SymbolsOutline"}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

----------------------------------------------------------------
-- GENERAL LSP SETTINGS
----------------------------------------------------------------

-- ---@usage Disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

----------------------------------------------------------------
-- VIM OPTIONS
----------------------------------------------------------------
-- Increase whichkey timeout len (default is 100ms). We don't need
-- which key to be appearing constantly
vim.opt.timeoutlen = 300

-- indent-blankline will pickup these characters
vim.opt.list = true
vim.opt.listchars:append("tab:▸\\")
vim.opt.listchars:append("eol:¬")
vim.opt.listchars:append("extends:❯")
vim.opt.listchars:append("precedes:❮")
vim.opt.listchars:append("trail:·") -- Highlight trailing spaces not leading
vim.opt.listchars:append("nbsp:·")

vim.opt.cursorlineopt = "number"

-- TODO: @JRY Change these values when we have keybindings for this
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.mouse = "" -- disallow the mouse to be used in neovim

----------------------------------------------------------------
-- PLUGIN OPTIONS
----------------------------------------------------------------
-- These are plguins that only take options from global variables
-- (old school style)

-- Make the buffer bar unclickable and have no close icons
-- Will be using Sayonara for closing buffers.
vim.g.barbar = {
  clickable = false,
  closable = false,
  insert_at_end = true,
}

-- Symbols outline
vim.g.symbols_outline = {
  width = 45
}

-- Minimap
local ignore_filetypes = {
  "help",
  "dashboard",
  "packer",
  "NvimTree",
  "startify",
  "lsp-installer",
  "nofile"
}
vim.g.minimap_auto_start = true
vim.g.minimap_auto_start_win_enter = false
vim.g.minimap_highlight_range = true
vim.g.minimap_highlight_search = true
vim.g.minimap_git_colors = true
vim.g.minimap_block_filetypes  = ignore_filetypes
vim.g.minimap_block_buftypes   = ignore_filetypes
vim.g.minimap_close_filetypes  = ignore_filetypes
vim.g.minimap_close_buftypes   = ignore_filetypes
----------------------------------------------------------------
-- ADDITIONAL PLUGINS
----------------------------------------------------------------
lvim.plugins = {
    -- THEME
    {
      "folke/tokyonight.nvim",
      disable = true
    },
    {
      "lunarvim/colorschemes",
      disable = true
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "thebearjew/nv-colorschemes",
      config = function ()
        -- First load the base16 theme
        local base16 = require("base16")
        local theme = "tomorrow-night"
        local colors = base16.themes(theme)
        local use_256_colorspace = true
        base16(colors, use_256_colorspace)
        -- Then load our custom highlights
        -- hl_themes is available from thebearjew/nv-colorschemes
        local highlight = require("core.highlight")
        highlight(theme)

      end
    },

    -- LAYOUT
    {
      "lukas-reineke/indent-blankline.nvim",
      config = function ()
        require("indent_blankline").setup({
          show_end_of_line = true,
          space_char_blankline = " ",
          filetype_exclude = { -- indent_blankline ignore filetypes
            "help",
            "packer",
            "dashboard",
            "NvimTree",
            "lsp-installer",
            "minimap"
          },
          space_char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
          },
        })
      end
    },
    {
      "wfxr/minimap.vim",
      run = function ()
        vim.cmd(":!cargo install --locked code-minimap")
      end
    },

    -- LSP
    {
      "nvim-treesitter/playground",
      -- opt = true,
      event = "BufRead",
      cmd = { "TSHighlightCapturesUnderCursor", "TSPlayground" },
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
      config = function ()
      end
    },

    -- UTILITIES AND KEYS
    {"tpope/vim-surround"},
    {"tpope/vim-obsession"}, -- Tmux ressurect using vim sessions
    {"bkad/CamelCaseMotion"}, -- CamelCase and snake_case motions
    {"mhinz/vim-sayonara", cmd = {"Sayonara"}}, -- Intelligent buffer closing
    { -- Trim trailing whitespace
      "cappyzawa/trim.nvim",
      config = function ()
        require"trim".setup({
          disable = {"markdown"},
        })
      end
    },
    { -- Any reference to a color will be highlighted with that color in neovim
      "norcalli/nvim-colorizer.lua",
        config = function()
          require("colorizer").setup({ "*" }, {
              RGB = true, -- #RGB hex codes
              RRGGBB = true, -- #RRGGBB hex codes
              RRGGBBAA = true, -- #RRGGBBAA hex codes
              rgb_fn = true, -- CSS rgb() and rgba() functions
              hsl_fn = true, -- CSS hsl() and hsla() functions
              css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
              css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
              })
      end,
    },
    {
      "karb94/neoscroll.nvim",
      event = "WinScrolled",
      config = function()
      require("neoscroll").setup({
            -- All these keys will be mapped to their corresponding default scrolling animation
            mappings = {
              "<C-u>",
              "<C-d>",
            },
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = false,            -- Stop at <EOF> when scrolling downwards
            use_local_scrolloff = true,  -- Use the local scope of scrolloff instead of the global scope
            respect_scrolloff = true,    -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = nil,       -- Default easing function
            -- Function to run before the scrolling animation starts
            pre_hook = function()
              vim.cmd[[MinimapClose]]
            end,
            post_hook = function()
              vim.defer_fn(function() vim.cmd[[Minimap]] end, 700)
            end,
      })
      end
    },

}

----------------------------------------------------------------
-- AUTOCOMMANDS
----------------------------------------------------------------
-- We want to close the Minimap when we leave the window to prevent it from
-- getting in the way of navigating to vsplits
-- lvim.autocommands.custom_groups = {
--   -- { "WinLeave", "*", "MinimapClose" }
-- }

----------------------------------------------------------------
-- STATUSLINE
----------------------------------------------------------------
local empty = require("lualine.component"):extend()
local components = require("lvim.core.lualine.components")
local colors = {
  nord1  = "#3B4252",
  nord3  = "#232527", -- Modified to match tomorrow-night
  nord5  = "#E5E9F0",
  nord6  = "#ECEFF4",
  nord7  = "#8FBCBB",
  nord8  = "#88C0D0",
  nord14 = "#EBCB8B",
}

lvim.builtin.lualine.options.theme = {
  normal = {
    a = { fg = colors.nord1, bg = colors.nord8 },
    b = { fg = colors.nord5, bg = colors.nord1 },
    c = { fg = colors.nord5, bg = colors.nord3 },
  },
  insert = { a = { fg = colors.nord1, bg = colors.nord6, } },
  visual = { a = { fg = colors.nord1, bg = colors.nord7, } },
  replace = { a = { fg = colors.nord1, bg = colors.nord13 } },
  inactive = {
    a = { fg = colors.nord1, bg = colors.nord8 },
    b = { fg = colors.nord5, bg = colors.nord1 },
    c = { fg = colors.nord5, bg = colors.nord1 },
  },
}

function empty:draw(default_highlight)
  self.status = ""
  self.applied_separator = ""
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < "x"
    for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= "table" then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = "" } or { left = "" }
      -- lualine_z is a scrollbar so don't give it a left arrowe
      if name == "lualine_z" and id == 3 and not left then
        comp.separator = { left = ""}
      end
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ""
  end
  local last_search = vim.fn.getreg "/"
  if not last_search or last_search == "" then
    return ""
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  -- return last_search .. "[" .. searchcount.current .. "/" .. searchcount.total .. "]"
  return "[" .. searchcount.current .. "/" .. searchcount.total .. "]"
end

local function modified()
  if vim.bo.modified then
    return "+"
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return "-"
  end
  return ""
end

local scrollbar = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local top = "Top"
    local bot = "Bot"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    local symbol = ""
    if current_line == 1 then
      symbol = top
    elseif line_ratio == 1.0 then
      symbol = bot
    else
      symbol = chars[index]
    end
    return symbol
  end,
  padding = { left = 1, right = 1 },
  color = { fg = colors.nord14, bg = colors.nord3 },
  cond = nil,
}

local sections = process_sections {
  lualine_a = { "mode" },
  lualine_b = {
    components.filename,
    components.diff,
    { modified, color = { bg = colors.red } },
    {
      "%w",
      cond = function()
      return vim.wo.previewwindow
      end,
    },
    {
      "%r",
      cond = function()
      return vim.bo.readonly
      end,
    },
    {
      "%q",
      cond = function()
      return vim.bo.buftype == "quickfix"
      end,
    },
  },
  lualine_c = {
    components.diagnostics,
  },
  lualine_x = {
    search_result,
    components.filetype
  },
  lualine_y = {
    components.treesitter,
    components.location,
  },
  lualine_z = {
    components.encoding,
    scrollbar
  }
}

lvim.builtin.lualine.options.component_separators = ""
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
lvim.builtin.lualine.sections.lualine_a = sections.lualine_a
lvim.builtin.lualine.sections.lualine_b = sections.lualine_b
lvim.builtin.lualine.sections.lualine_c = sections.lualine_c
lvim.builtin.lualine.sections.lualine_x = sections.lualine_x
lvim.builtin.lualine.sections.lualine_y = sections.lualine_y
lvim.builtin.lualine.sections.lualine_z = sections.lualine_z
lvim.builtin.lualine.inactive_sections = {
  lualine_c = { "%f %y %m" },
  lualine_x = {}
}
