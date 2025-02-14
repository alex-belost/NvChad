return {
  "goolord/alpha-nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VimEnter",
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    -- Заголовок
    dashboard.section.header.val = {
      "███╗   ██╗██╗   ██╗ ██████╗██╗  ██╗ █████╗ ██████╗",
      "████╗  ██║██║   ██║██╔════╝██║  ██║██╔══██╗██╔══██╗",
      "██╔██╗ ██║██║   ██║██║     ███████║███████║██║  ██║",
      "██║╚██╗██║██║   ██║██║     ██╔══██║██╔══██║██║  ██║",
      "██║ ╚████║╚██████╔╝╚██████╗██║  ██║██║  ██║██████╔╝",
      "╚═╝  ╚═══╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝",
    }

    -- Кнопки меню
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("s", "  Restore last session", ":lua require('persistence').load({ last = true })<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Футер
    dashboard.section.footer.val = { "🚀 Happy coding with NvChad! 🚀" }

    -- Установка темы
    alpha.setup(dashboard.opts)

    -- Автооткрытие `alpha-nvim`, если при запуске нет открытых буферов
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          require("alpha").start()
        end
      end,
    })
  end,
}
