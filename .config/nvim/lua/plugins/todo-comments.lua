return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    signs = true,
    sign_priority = 8,
    keywords = {
      FIX = { icon = ' ', color = 'error' },
      TODO = { icon = ' ', color = 'info' },
      HACK = { icon = ' ', color = 'warning' },
      WARN = { icon = ' ', color = 'warning' },
      PERF = { icon = ' ', color = 'default' },
      NOTE = { icon = ' ', color = 'hint' },
      TEST = { icon = ' ', color = 'test' },
    },
    highlight = {
      before = '',
      keyword = 'wide_bg',
      after = '',
    },
    search = {
      command = 'rg',
      pattern = '\\b(TODO|FIXME|HACK|WARN|NOTE|TEST|FIX)\\b',
    },
  },
}
