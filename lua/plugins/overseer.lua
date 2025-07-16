local camke_build = {
  name = "cmake build",
  builder = function()
    -- Full path to current file (see :help expand())
    return {
      cmd = { "cmake", "--build", "build", "--config", "Debug"},
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp", "cmake" },
  },
}

-- Overseer
return {
  'stevearc/overseer.nvim',
  event = {"LspAttach"},
  lazy = true,
  opts = {},
  config = function()
    require("overseer").add_template_hook({
      module = "overseer.template.vscode",
      callback = function(tasks)
        for _, task in ipairs(tasks) do
          require("overseer").add_task(task)
        end
      end
    })
    require('overseer').setup({
      tempaltes = { "builtin", --[[ clang_build, ]] camke_build, "vscode" }
    })

  end
}
