local kind_icons = {
  Text = '󰉿',
  Method = 'm',
  Function = '󰊕',
  Constructor = '',
  Field = '',
  Variable = '󰆧',
  Class = '󰌗',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '󰎠',
  Enum = '',
  Keyword = '󰌋',
  Snippet = '',
  Color = '󰏘',
  File = '󰈙',
  Reference = '',
  Folder = '󰉋',
  EnumMember = '',
  Constant = '󰇽',
  Struct = '',
  Event = '',
  Operator = '󰆕',
  TypeParameter = '󰊄',
}

return {
  {
    {
      -- snippet plugin
      "L3MON4D3/LuaSnip",
      event = "BufReadPost",
      lazy = true,
      dependencies = "rafamadriz/friendly-snippets",
      opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      config = function()
        require("luasnip").config.set_config()

        -- vscode format
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

        -- snipmate format
        require("luasnip.loaders.from_snipmate").load()
        require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

        -- lua format
        require("luasnip.loaders.from_lua").load()
        require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

        vim.api.nvim_create_autocmd("InsertLeave", {
          callback = function()
            if
              require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
              and not require("luasnip").session.jump_active then
              require("luasnip").unlink_current()
            end
          end,
        })
      end,
    },

    -- cmp sources plugins
    {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },
  {
    'saghen/blink.nvim',
    version = "1.*",
    build = 'cargo build --release', -- for delimiters
    keys = {
      -- chartoggle
      {
        '<C-;>',
        function()
          require('blink.chartoggle').toggle_char_eol(';')
        end,
        mode = { 'n', 'v' },
        desc = 'Toggle ; at eol',
      },
      {
        ',',
        function()
          require('blink.chartoggle').toggle_char_eol(',')
        end,
        mode = { 'n', 'v' },
        desc = 'Toggle , at eol',
      },

      -- tree
      -- { '<C-e>', '<cmd>BlinkTree reveal<cr>', desc = 'Reveal current file in tree' },
      { '<leader>e', '<cmd>BlinkTree toggle<cr>', desc = 'Reveal current file in tree' },
      -- { '<leader>e', '<cmd>BlinkTree toggle-focus<cr>', desc = 'Toggle file tree focus' },
    },
    -- all modules handle lazy loading internally
    lazy = false,
    opts = {
      chartoggle = { enabled = true },
      tree = {
        enabled = true,
      },
      pairs = {
        enabled = true,
        --- @module 'blink.pairs'
        --- @type blink.pairs.Config
        opts = {
          mappings = {
            -- you can call require("blink.pairs.mappings").enable()
            -- and require("blink.pairs.mappings").disable()
            -- to enable/disable mappings at runtime
            enabled = true,
            cmdline = true,
            -- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
            -- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
            disabled_filetypes = {},
            -- see the defaults:
            -- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
            pairs = {},
          },
          highlights = {
            enabled = true,
            -- requires require('vim._extui').enable({}), otherwise has no effect
            cmdline = true,
            groups = {
              'BlinkPairsOrange',
              'BlinkPairsPurple',
              'BlinkPairsBlue',
            },
            unmatched_group = 'BlinkPairsUnmatched',

            -- highlights matching pairs under the cursor
            matchparen = {
              enabled = true,
              -- known issue where typing won't update matchparen highlight, disabled by default
              cmdline = false,
              group = 'BlinkPairsMatchParen',
            },
          },
          debug = false,
        }
      }
    },
  },
}
