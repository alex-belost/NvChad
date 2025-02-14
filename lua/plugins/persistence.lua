return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup {
        dir = vim.fn.stdpath "data" .. "/sessions/",
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
}
