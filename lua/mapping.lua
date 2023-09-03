local utility = require "utility"
local maps = utility.empty_map_table()
local sections = {
  f = { desc = "Find" },
}
maps.n[";"] = { ":" }
maps.i["jk"] = { "<Esc>", desc = "exit normal mode" }

-- toggle nvim tree
maps.n["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", desc = "display nvim tree" }

-- clear highlight when go to normal mode
maps.n["<Esc>"] = { "noh <cr>", desc = "Clear highlights" }

-- navigate within insert mode
maps.i["<C-h>"] = { "<Left>", desc = "Move left" }
maps.i["<C-l>"] = { "<Right>", desc = "Move right" }
maps.i["<C-j>"] = { "<Down>", desc = "Move down" }
maps.i["<C-k>"] = { "<Up>", desc = "Move up" }

-- switch between windows
maps.n["<C-h>"] = { "<c-w>h", desc = "Window left" }
maps.n["<C-l>"] = { "<c-w>l", desc = "Window right" }
maps.n["<C-j>"] = { "<c-w>j", desc = "Window down" }
maps.n["<C-k>"] = { "<c-w>k", desc = "Window up" }


  -- lsp 
maps.n["<leader>lr"] = { "<cmd> lua vim.lsp.buf.rename <cr>", desc = "lsp something", }
maps.n["<leader>la"] = { "<cmd> lua vim.lsp.buf.code_action <cr>", desc = "lsp something" }
maps.n["gd"] = { "<cmd> lua vim.lsp.buf.definition <cr>", desc = "lsp something" }
maps.n["gD"] = { "<cmd> lua vim.lsp.buf.declaration <cr>", desc = "lsp something" }
maps.n["gi"] = { "<cmd> lua vim.lsp.buf.implementation <cr>", desc = "lsp something" }
maps.n["<leader>lD"] = { "<cmd> lua vim.lsp.buf.type_definition <cr>", desc = "lsp something" }
maps.n["K"] = { "<cmd> lua vim.lsp.buf.hover <cr>", desc = "lsp something" }

-- telescope
maps.n["<leader>f"] = sections.f
maps.n["<leader>ff"] = { "<cmd> Telescope find_files <cr>", desc = "find files in current root" }
maps.n["<leader>fg"] = { "<cmd> Telescope live_grep <cr>", desc = "live group" }
maps.n["<leader>fb"] = { "<cmd> Telescope buffers <cr>", desc = "find in buffers" }
maps.n["<leader>fh"] = { "<cmd> Telescope help_tags <cr>", desc = "show help tags" }

-- Comment
maps.n["<leader>/"] = {
  function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
  desc = "Toggle comment line",
}
maps.v["<leader>/"] = {
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  desc = "Toggle comment for selection",
}


utility.set_mappings(maps)
