local utility = require "utility"
local maps = utility.empty_map_table()

maps.n[";"] = { ":" }
maps.i["jk"] = { "<Esc>", desc = "exit normal mode" }

-- toggle nvim tree
maps.n["<leader>e"] = { "<cmd> NvimTreeToggle <CR>" }

-- clear highlight when go to normal mode
maps.n["<Esc>"] = { "noh <CR>", desc = "Clear highlights" }

-- navigate within insert mode
maps.i["<C-h>"] = { "<Left>", desc = "Move left" }
maps.i["<C-l>"] = { "<Right>", desc = "Move right" }
maps.i["<C-j>"] = { "<Down>", desc = "Move down" }
maps.i["<C-k>"] = { "<Up>", desc = "Move up" }

-- switch between windows
maps.n["<C-h>"] = { "<C-w>h", desc = "Window left" }
maps.n["<C-l>"] = { "<C-w>l", desc = "Window right" }
maps.n["<C-j>"] = { "<C-w>j", desc = "Window down" }
maps.n["<C-k>"] = { "<C-w>k", desc = "Window up" }

utility.set_mappings(maps)
