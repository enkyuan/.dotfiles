return {
  "EL-MASTOR/bufferlist.nvim",
  lazy = true,
  keys = { { "<Leader>b", desc = "[BUFFER] Open bufferlist" } }, -- keymap to load the plugin, it should be the same as keymap.open_buflist
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
