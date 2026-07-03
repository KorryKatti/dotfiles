-- lua/plugins/cord.lua

return {
  'vyfor/cord.nvim',
  ---@type CordConfig
  opts = {
    display = {
      theme = 'catppuccin',
      flavor = 'dark',
      view = 'full',
      swap_fields = false,
      swap_icons = false,
    },
    extensions = {
      diagnostics = {
        scope = 'buffer',
        severity = { min = vim.diagnostic.severity.WARN },
        override = true,
      },
    },
    hooks = {
      post_activity = function(opts, activity)
        local version = vim.version()
        activity.assets.small_text = string.format('Neovim %s.%s.%s', version.major, version.minor, version.patch)
      end,
    },
  },
}
