-- lua/plugins/areyoulockedin.lua

return {
  'voltycodes/areyoulockedin.nvim',
  event = 'VeryLazy',
  config = function()
    require("areyoulockedin").setup({ session_key = "key" })
  end
}
