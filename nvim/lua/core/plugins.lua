local global = require "core.global"

-- Boostrap packer
local fn = vim.fn
local install_path = global.data_dir..'pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local config = {
  profile = {
    enable = true,
    threshold = 1,
  }
}


return require("packer").startup({
  config = config,
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- =====================
    -- THEME
    -- =====================
    use 'EdenEast/nightfox.nvim' -- config/theme.lua

    -- =====================
    -- UI STUFF
    -- =====================
    -- Intelligent buffer closing
    use({ "mhinz/vim-sayonara", cmd = {"Sayonara"} })
    -- Top buffer/tab line
    use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}
    -- Git in the gutter
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
    }
    -- UI stuff (mainly used for lsp overrides)
    use("RishabhRD/popfix")
    use("RishabhRD/nvim-lsputils")
    -- Colorizer
    use("norcalli/nvim-colorizer.lua")
    -- Trouble
    -- Display errors and other information easily in the UI
    use("folke/trouble.nvim")
    -- Git blame line -> Show who last modified each line
    use("tveskag/nvim-blame-line")
    -- indent lines
    -- This plugin can be used to show the end of line character
    -- as well as the spave character and vertical bars representing
    -- indentation levels (whcih I don't know if I like yet or not)
    use("lukas-reineke/indent-blankline.nvim") -- TODO: Configure this plugin
    -- statusline
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Nvim Tree file explorer
    use { -- TODO: Configure mappings for opening splits, and file operations like add rename etc.
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }

    -- Which key lists key mappings
    use("liuchengxu/vim-which-key")
    -- =====================
    -- TELESCOPE
    -- =====================
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" }, { "nvim-lua/popup.nvim" } },
    })
    use({
      "romgrk/fzy-lua-native",
      requires = { { "nvim-telescope/telescope.nvim" } },
    })
    use({
      "nvim-telescope/telescope-fzy-native.nvim",
      requires = { { "nvim-telescope/telescope.nvim" } },
    })

    -- =====================
    -- Programming
    -- =====================
    -- Language Server Client(s)
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use("ray-x/lsp_signature.nvim") -- Show a popup with signature info

    -- Autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")

    -- Treesitter
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
    use("nvim-treesitter/playground")
    use("windwp/nvim-ts-autotag")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Utilities
    use("tpope/vim-commentary") -- Comment stuff out
    use("bkad/CamelCaseMotion") -- CamelCase and snake_case motions

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end

  end
})

