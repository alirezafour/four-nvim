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


-- use pwsh or powershell terminal in windows
if vim.loop.os_uname() == "Window_NT" then
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
