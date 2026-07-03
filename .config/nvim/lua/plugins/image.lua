-- lua/plugins/image.lua

-- NOTE: This plugin requires ImageMagick to be installed on your system.
return {
  "3rd/image.nvim",
  opts = {
    processor = "magick_cli",
  },
}
