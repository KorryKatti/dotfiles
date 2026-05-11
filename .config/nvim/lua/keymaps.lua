-- lua/keymaps.lua

local map = vim.keymap.set

-- Normal Mode
-- Better window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Navigate to the window on the left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Navigate to the window below' })
map('n', '<C-k>', '<C-w>k', { desc = 'Navigate to the window above' })
map('n', '<C-l>', '<C-w>l', { desc = 'Navigate to the window on the right' })

-- Resize with arrows
map('n', '<C-Up>', ':resize -2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize +2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files in current directory' })
map('n', '<C-t>', '<cmd>Telescope find_files<cr>', { desc = 'Find files in current directory' })
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Find files in git repository' })

-- LSP
map('n', 'K', vim.lsp.buf.hover, { desc = 'Display hover information' })
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Show code actions' })

-- C++ Template
vim.api.nvim_create_user_command('Cftemp', function()
  if vim.bo.filetype ~= 'cpp' then
    print("Not a C++ file")
    return
  end
  local template = {
    "#include <bits/stdc++.h>",
    "using namespace std;",
    "#define fast_io ios::sync_with_stdio(false);cin.tie(nullptr);",
    "#define ll long long int",
    "#define vi vector<int>",
    "#define vll vector<long long int>",
    "",
    "void solve(){}",
    "",
    "int main(){",
    "\tfast_io;",
    "\tint t;",
    "\tcin >> t;",
    "\twhile (t--){",
    "\t\tsolve();",
    "\t}",
    "\treturn 0;",
    "}",
  }
  vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
end, { desc = 'Insert C++ template' })

-- Image Viewer
map('n', '<leader>i', '<cmd>ImageViewer image.jpg<CR>', { desc = 'Display image.jpg' })
