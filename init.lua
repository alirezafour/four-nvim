require "options"
require "plugin"
require "mapping"

-- auto formating for cpp files
function FormatBuffer()
  if vim.bo.modified and vim.fn.empty(vim.fn.findfile('.clang-format', vim.fn.expand('%:p:h') .. ';')) == 0 then
    local cursor_pos = vim.fn.getpos('.')
    vim.cmd('%!clang-format')
    vim.fn.setpos('.', cursor_pos)
  end
end

vim.cmd('autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag,*.mcpp,*mhpp,*ixx lua FormatBuffer()')


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

-- use pwsh or powershell terminal in windows
if is_windows == 1 then
  -- Determine the appropriate shell (pwsh if available, otherwise powershell)
  local shell = vim.fn.executable('pwsh') == 1 and 'pwsh' or 'powershell'

  -- Set the shell and related options
  vim.opt.shell = shell
  vim.opt.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[\'Out-File:Encoding\']=\'utf8\';'
  vim.opt.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
  vim.opt.shellpipe = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
end
