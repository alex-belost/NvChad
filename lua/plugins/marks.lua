return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  config = function()
    require("marks").setup {
      -- Настройки отображения закладок
      sign_priority = 6, -- Приоритет отображения значков в gutter
      -- Автообновление знаков
      refresh_interval = 250,
      -- Кастомные символы для меток
      sign_mark = "⚑",
      sign_bookmark = "★",
    }
  end,
}
