-- init.lua

-- [[ Install `lazy.nvim` plugin manager ]]
--    See https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Basic Settings ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- [[ Set leader key ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Keymaps ]]
require('keymaps')

-- [[ Configure `lazy.nvim` ]]
require('lazy').setup({
  spec = {
    -- find all plugins in lua/plugins
    { import = 'plugins' },
  },
})

-- [[ Set `tokyonight` colorscheme ]]
vim.cmd.colorscheme 'tokyonight'

-- [[ Enable Treesitter highlighting ]]
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    if pcall(vim.treesitter.start, args.buf) then
      -- treesitter started successfully
      -- idk if its working or not atp
    end
  end,
})
