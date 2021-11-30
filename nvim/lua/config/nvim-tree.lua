vim.g["nvim_tree_icons"] = {
  folder = {
    -- Use the emtpy open icon for full directories that are open
    open = ""
  },
  git = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "",
    untracked = "",
    deleted = "",
    ignored = "◌"
  }
}

require'nvim-tree'.setup({
  git = {
    enable = true,
    ignore = false,
  }
})

-- - type `g?` to see the help UI with keybindings
-- - move around like in any vim buffer
-- - '<CR>' on '..' will cd in the above directory
-- - typing '<C-]>' will cd in the directory under the cursor
-- - typing '<BS>' will close current opened directory or parent
-- - typing 'P' will move cursor to the parent directory

-- - type 'a' to add a file
-- - type 'r' to rename a file
-- - type `<C-r>` to rename a file and omit the filename on input
-- - type 'x' to add/remove file/directory to cut clipboard
-- - type 'c' to add/remove file/directory to copy clipboard
-- - type 'p' to paste from clipboard. Cut clipboard has precedence over copy
--   (will prompt for confirmation)
-- - type 'd' to delete a file (will prompt for confirmation)
-- - type ']c' to go to next git item
-- - type '[c' to go to prev git item
-- - type '-' to navigate up one directory
-- - type 's' to open a file with default system application or a folder with default file manager
-- - type '<' to navigate to the previous sibling of current file/directory
-- - type '>' to navigate to the next sibling of current file/directory
-- - type 'J' to navigate to the first sibling of current file/directory
-- - type 'K' to navigate to the last sibling of current file/directory

-- - if the file is a directory, '<CR>' will open the directory
-- - otherwise it will open the file in the buffer near the tree
-- - if the file is a symlink, '<CR>' will follow the symlink
-- - '<C-v>' will open the file in a vertical split
-- - '<C-x>' will open the file in a horizontal split
-- - '<C-t>' will open the file in a new tab
-- - '<Tab>' will open the file as a preview (keeps the cursor in the tree)
-- - 'I' will toggle visibility of folders hidden via |g:nvim_tree_ignore|
-- - 'R' will refresh the tree

-- - Double left click acts like '<CR>'
-- - Double right click acts like '<C-]>'

-- Defaults to:
-- >
--   lua <<EOF
--     local tree_cb = require'nvim-tree.config'.nvim_tree_callback
--     local list = {
--       { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
--       { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
--       { key = "<C-v>",                        cb = tree_cb("vsplit") },
--       { key = "<C-x>",                        cb = tree_cb("split") },
--       { key = "<C-t>",                        cb = tree_cb("tabnew") },
--       { key = "<",                            cb = tree_cb("prev_sibling") },
--       { key = ">",                            cb = tree_cb("next_sibling") },
--       { key = "P",                            cb = tree_cb("parent_node") },
--       { key = "<BS>",                         cb = tree_cb("close_node") },
--       { key = "<S-CR>",                       cb = tree_cb("close_node") },
--       { key = "<Tab>",                        cb = tree_cb("preview") },
--       { key = "K",                            cb = tree_cb("first_sibling") },
--       { key = "J",                            cb = tree_cb("last_sibling") },
--       { key = "I",                            cb = tree_cb("toggle_ignored") },
--       { key = "H",                            cb = tree_cb("toggle_dotfiles") },
--       { key = "R",                            cb = tree_cb("refresh") },
--       { key = "a",                            cb = tree_cb("create") },
--       { key = "d",                            cb = tree_cb("remove") },
--       { key = "D",                            cb = tree_cb("trash") },
--       { key = "r",                            cb = tree_cb("rename") },
--       { key = "<C-r>",                        cb = tree_cb("full_rename") },
--       { key = "x",                            cb = tree_cb("cut") },
--       { key = "c",                            cb = tree_cb("copy") },
--       { key = "p",                            cb = tree_cb("paste") },
--       { key = "y",                            cb = tree_cb("copy_name") },
--       { key = "Y",                            cb = tree_cb("copy_path") },
--       { key = "gy",                           cb = tree_cb("copy_absolute_path") },
--       { key = "[c",                           cb = tree_cb("prev_git_item") },
--       { key = "]c",                           cb = tree_cb("next_git_item") },
--       { key = "-",                            cb = tree_cb("dir_up") },
--       { key = "s",                            cb = tree_cb("system_open") },
--       { key = "q",                            cb = tree_cb("close") },
--       { key = "g?",                           cb = tree_cb("toggle_help") },
--     }
-- <
