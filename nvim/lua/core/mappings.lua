local execute = vim.cmd
local map = vim.api.nvim_set_keymap

local amap = function(lhs, rhs, silent)
  map("", lhs, rhs, { silent = silent })
end
local noremap = function(lhs, rhs, silent)
  map("n", lhs, rhs, { noremap = true, silent = silent })
  map("v", lhs, rhs, { noremap = true, silent = silent })
end

local nnoremap = function(lhs, rhs, silent)
  map("n", lhs, rhs, { noremap = true, silent = silent })
end

local nmap = function(lhs, rhs)
  map("n", lhs, rhs, {})
end

local inoremap = function(lhs, rhs)
	map("i", lhs, rhs, { noremap = true })
end

local inosilentexprremap = function(lhs, rhs)
	map("i", lhs, rhs, { noremap = true, expr = true, silent = true })
end

local vnoremap = function(lhs, rhs)
	map("v", lhs, rhs, { noremap = true })
end

local xnoremap = function(lhs, rhs)
  map("x", lhs, rhs, { noremap = true })
end

local cnoremap = function(lhs, rhs)
  map("c", lhs, rhs, { noremap = true })
end

-- -----------------------------------------------------
-- Disabling arrow keys, space key, exmode enter
-- with Q key, help with F1, etc.
-- -----------------------------------------------------
nnoremap("<up>"    , "<NOP>")
nnoremap("<down>"  , "<NOP>")
nnoremap("<left>"  , "<NOP>")
nnoremap("<right>" , "<NOP>")
nnoremap("<bs>"    , "<NOP>")
nnoremap("<delete>", "<NOP>")
inoremap("<up>"    , "<NOP>")
inoremap("<down>"  , "<NOP>")
inoremap("<left>"  , "<NOP>")
inoremap("<right>" , "<NOP>")
nnoremap("<Space>" , "<NOP>")
inoremap("<F1>"    , "<NOP>")
nnoremap("<F1>"    , "<NOP>")
nnoremap("Q"       , "<NOP>")

-- -----------------------------------------------------
-- Vim defaults overriding
-- -----------------------------------------------------
-- Disable macro recording
nnoremap("q", "<NOP>")

-- Easier window switching
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap("j" , "gj")
nnoremap("k" , "gk")
nnoremap("gj", "5j")
nnoremap("gk", "5k")
vnoremap("j" , "gj")
vnoremap("k" , "gk")
vnoremap("gj", "5j")
vnoremap("gk", "5k")

-- When jump to next match also center screen
-- Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
nnoremap("n", ":norm! nzz<CR>", true)
nnoremap("N", ":norm! Nzz<CR>", true)
vnoremap("n", ":norm! nzz<CR>", true)
vnoremap("N", ":norm! Nzz<CR>", true)

-- Same when moving up and down
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-f>", "<C-f>zz")
nnoremap("<C-b>", "<C-b>zz")
vnoremap("<C-u>", "<C-u>zz")
vnoremap("<C-d>", "<C-d>zz")
vnoremap("<C-f>", "<C-f>zz")
vnoremap("<C-b>", "<C-b>zz")

-- Remap H and L (top, bottom of screen to left and right end of line)
nnoremap("H", "^")
nnoremap("L", "$")
vnoremap("H", "^")
vnoremap("L", "g_")

-- More logical Y (default was alias for yy)
noremap("Y", "y$")
-- nnoremap Y y$

-- Don't yank to default register when changing something
nnoremap("c", '"xc')
xnoremap("c", '"xc ')

-- After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap("y", "y`]")
vnoremap("p", '"_dP`]')
nnoremap("p", "p`]")

-- Use CamelCaseMotion instead of default motions
amap("w", "<Plug>CamelCaseMotion_w", true)
amap("b", "<Plug>CamelCaseMotion_b", true)
amap("e", "<Plug>CamelCaseMotion_e", true)
amap("ge", "<Plug>CamelCaseMotion_ge", true)

-- Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap("cw", "ce")
nmap("dw", "de")

-- Don't cancel visual select when shifting
xnoremap("<", "<gv")
xnoremap(">", ">gv")

-- -----------------------------------------------------
-- Common tasks
-- -----------------------------------------------------
-- Quick save and close buffer
nnoremap("<leader>s", ":w<CR>")
nnoremap("<leader>w", ":Sayonara!<CR>", true)
nnoremap("<leader>q", ":Sayonara<CR>" , true)

-- Yank and paste from clipboard
nnoremap("<leader>y ", '"+y')
vnoremap("<leader>y ", '"+y')
nnoremap("<leader>yy", '"+yy')
nnoremap("<leader>p ", '"+p')

-- Move visual block
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Reselect last-pasted text
nnoremap("gp", "`[v`]")

-- Keep the cursor in place while joining lines
nnoremap("J", "mzJ`z")

-- [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap("S","mzi<CR><ESC>`z")

-- Easier fold toggling
-- TODO: Map folding to treesitter
-- nnoremap("<Space>z", za )

-- Start substitute on current word under the cursor
nnoremap("<Space>s", ":%s///gc<Left><Left><Left>")

vnoremap("<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')

-- Start search on current word under the cursor
nnoremap("<Space>/", "/<CR>")

-- Start reverse search on current word under the cursor
nnoremap("<Space>?", "?<CR>")

-- Faster sort
vnoremap("<Space>s", ":!sort<CR>")

-- -----------------------------------------------------
-- NvimTree
-- -----------------------------------------------------
nnoremap("<Space>nf", ":NvimTreeFindFileToggle<CR>")
nnoremap("<Space>nr", ":NvimTreeRefresh<CR>")


-- -----------------------------------------------------
-- Which Key
-- -----------------------------------------------------
nnoremap("<leader>/", ":WhichKey '<leader>'<CR>", true)

-- -----------------------------------------------------
-- Window / Buffer management
-- -----------------------------------------------------
-- Buffers navigation and management
nnoremap("+" , ":bn<CR>", true)
nnoremap("_" , ":bp<CR>", true)

-- 10x horizontal window resize
amap("<M-l>", "10<C-w>>", true)
amap("<M-h>", "10<C-w><", true)
amap("<M-j>", "10<C-w>-", true)
amap("<M-k>", "10<C-w>+", true)

nnoremap("<C-w>z", ":MaximizerToggle<CR>")
inoremap("<C-w>z", ":MaximizerToggle<CR>")

-- -----------------------------------------------------
-- Vim Command line abbreviations and mappings
-- -----------------------------------------------------
-- When in the command line, :qq will expand to :qall for fast quitall
cnoremap("ww", "wqal")
cnoremap("qq", "qall")

