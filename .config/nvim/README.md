# Neovim Configuration

This is a Neovim configuration using `init.lua` and the `lazy.nvim` plugin manager.

## Structure

- `init.lua`: The main entry point for the configuration. It installs `lazy.nvim` and loads the plugins.
- `lua/plugins/`: This directory contains the plugin specifications. Each file in this directory returns a table of plugins to be loaded by `lazy.nvim`.
