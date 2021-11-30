local M = {}

local home = os.getenv("HOME")
local sep = M.is_windows and '\\' or '/'
local os_name = vim.loop.os_uname().sysname


P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

M.load_variables = function()
  M.is_mac     = os_name == 'Darwin'
  M.is_linux   = os_name == 'Linux'
  M.is_windows = os_name == 'Windows'
  M.vim_path    = vim.fn.stdpath('config')
  M.cache_dir   = home .. sep..'.cache'..sep..'nvim'..sep
  M.modules_dir = M.vim_path .. sep..'modules'
  M.sep = sep
  M.home = home
  M.data_dir = string.format('%s/site/',vim.fn.stdpath('data'))
end


M.load_variables()

return M

