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
    text = {
      editing = function(opts)
        return string.format('Editing %s - %s:%s', opts.filename, opts.cursor_line, opts.cursor_char)
      end,
      workspace = function(opts)
        local hour = tonumber(os.date('%H'))
        local status =
          hour >= 22 and '🌙 Late night coding' or
          hour >= 18 and '🌆 Evening session' or
          hour >= 12 and '☀️ Afternoon coding' or
          hour >= 5 and '🌅 Morning productivity' or
          '🌙 Midnight hacking'

        return string.format('%s: %s', status, opts.filename)
      end,
    },
    hooks = {
      post_activity = function(opts, activity)
        local version = vim.version()
        activity.assets.small_text = string.format('Neovim %s.%s.%s', version.major, version.minor, version.patch)
      end,
    },
  },
}
