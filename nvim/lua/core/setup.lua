local global = require 'core.global'
local vim = vim

-- Create cache dir and subs dir
local create_data_dirs = function ()
  local data_dir = {
    global.cache_dir..'backup',
    global.cache_dir..'session',
    global.cache_dir..'swap',
    global.cache_dir..'tags',
    global.cache_dir..'undo'
  }
  -- Check if the cache dirs exists.
  -- If it does not, create it.
  -- Don't create other dirs
  if vim.fn.isdirectory(global.cache_dir) == 0 then
    os.execute("mkdir -p " .. global.cache_dir)
    for _,v in pairs(data_dir) do
      if vim.fn.isdirectory(v) == 0 then
        os.execute("mkdir -p " .. v)
      end
    end
  end
end

-- Disbale some plugins that are bundled with Neovim
local disable_distributed_plugins= function()
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  vim.g.loaded_matchit           = 1
  vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1
end

local set_leader_map = function()
  local leader_key = ","
  vim.g.mapleader = leader_key -- Leader is "," comma
  vim.api.nvim_set_keymap('n',leader_key,'',{noremap = true})
  vim.api.nvim_set_keymap('x',leader_key,'',{noremap = true})
end

local load_core =function()
  create_data_dirs()
  disable_distributed_plugins()
  set_leader_map()
end

-- Initialize
load_core()
