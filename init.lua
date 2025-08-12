require "options"
require "plugin"
require "mapping"
require "lsp"

-------------------------------------- autocmds ------------------------------------------
-- auto formating for cpp files
-- function FormatBuffer()
--   if vim.bo.modified and vim.fn.empty(vim.fn.findfile('.clang-format', vim.fn.expand('%:p:h') .. ';')) == 0 then
--     local cursor_pos = vim.fn.getpos('.')
--     vim.cmd('%!clang-format')
--     vim.fn.setpos('.', cursor_pos)
--   end
-- end

-- vim.cmd('autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.mcpp,*.mhpp,*.ixx,*.cppm,*.hppm lua FormatBuffer()')


-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
