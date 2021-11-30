local set = vim.opt
local wo = vim.wo
local go = vim.go
local bo = vim.bo
local cmd = vim.cmd

set.syntax="enable"
set.background="dark"
set.shell="/bin/zsh"                                -- Setting shell to zsh
set.number=true
set.relativenumber=false                            -- Absolute numbers
set.showmode=true                                   -- Always show mode
set.showcmd=true                                    -- Show commands as you type them
set.cmdheight=1                                     -- Command line height
set.pumheight=10                                    -- Completion window max size
set.hidden=true                                     -- Enables to switch between unsaved buffers and keep undo history
set.clipboard = "unnamedplus"                       -- Allow to use system clipboard


set.showmatch=true                                  -- Show matching brackets when text indicator is over them
set.matchtime=2                                     -- How many tenths of a second to blink when matching brackets
set.virtualedit="block"                             -- To be able to select past EOL in visual block mode
set.scrolloff=5                                     -- Scroll when closing to top or bottom of the screen
set.updatetime=300                                  -- Update time used to create swap file or other things
set.cursorline=true                                 -- Highlight the active line but only style the line number highlight

vim.opt.shortmess:append("c") -- From COC: don't give |ins-completion-menu| messages.
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.termguicolors = true
vim.opt.iskeyword:append("-")
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.ruler = true


--
-- Global Options
--
go.startofline=false                               -- Prevent cursor from moving to beginning of line when switching buffers
go.joinspaces=false                                -- No extra space when joining a line which ends with . ? !
go.splitbelow=true                                 -- splitting a window will put the new window below the current
go.splitright=true                                 -- splitting a window will put the new window right of the current

go.spellfile="~/.config/nvim/spell/dictionary.utf-8.add"
go.spelllang="en_us"                               -- Set language to US English
go.spell=false                                     -- Disable checking by default

                                                   -- Time out on key codes but not mappings.
                                                   -- Basically this makes terminal Vim work sanely. (by Steve Losh)
go.timeout=false
go.ttimeout=true
go.ttimeoutlen=10
                                                   -- As it turns out, there is a negative performce issue when having lazy redraw
                                                   -- on while use tmux. It causes an ugly redraw that makes the entire pane blank
go.lazyredraw=false                                -- Don't redraw while executing macros (better performance)

--
-- Window Options
--
wo.wrap=false                                      -- Do not wrap long line


--
-- Buffer Options
--
bo.swapfile=false                                  -- New buffers will be loaded without creating a swapfile

