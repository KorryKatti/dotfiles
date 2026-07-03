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

-- Buffer Navigation
map('n', '<leader><Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Close buffer' })

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
-- ============================================================================
-- C++ TEMPLATE - Enhanced
-- ============================================================================

vim.api.nvim_create_user_command('Cftemp', function()
  if vim.bo.filetype ~= 'cpp' then
    print("Not a C++ file")
    return
  end
  local template = {
    "#include <bits/stdc++.h>",
    "using namespace std;",
    "",
    "// Macros",
    "#define fast_io ios::sync_with_stdio(false);cin.tie(nullptr);",
    "#define ll long long int",
    "#define ull unsigned long long int",
    "#define vi vector<int>",
    "#define vll vector<long long int>",
    "#define pii pair<int, int>",
    "#define pll pair<ll, ll>",
    "#define all(x) (x).begin(), (x).end()",
    "#define sz(x) (int)(x).size()",
    "",
    "// Constants",
    "const ll MOD = 1e9 + 7;",
    "const ll INF = 1e18;",
    "",
    "// Utility Functions",
    "ll mod_pow(ll base, ll exp, ll mod) {",
    "\tll result = 1;",
    "\twhile (exp > 0) {",
    "\t\tif (exp % 2 == 1) result = (result * base) % mod;",
    "\t\tbase = (base * base) % mod;",
    "\t\texp /= 2;",
    "\t}",
    "\treturn result;",
    "}",
    "",
    "ll gcd(ll a, ll b) {",
    "\twhile (b) {",
    "\t\tll temp = b;",
    "\t\tb = a % b;",
    "\t\ta = temp;",
    "\t}",
    "\treturn a;",
    "}",
    "",
    "void solve() {",
    "\t// Solution code here",
    "}",
    "",
    "int main() {",
    "\tfast_io;",
    "\tint t;",
    "\tcin >> t;",
    "\twhile (t--) {",
    "\t\tsolve();",
    "\t}",
    "\treturn 0;",
    "}",
  }
  vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
end, { desc = 'Insert C++ competitive programming template' })

-- ============================================================================
-- C++ SINGLE-TEST TEMPLATE (for problems without multiple test cases)
-- ============================================================================

vim.api.nvim_create_user_command('Cftempone', function()
  if vim.bo.filetype ~= 'cpp' then
    print("Not a C++ file")
    return
  end
  local template = {
    "#include <bits/stdc++.h>",
    "using namespace std;",
    "",
    "// Macros",
    "#define fast_io ios::sync_with_stdio(false);cin.tie(nullptr);",
    "#define ll long long int",
    "#define ull unsigned long long int",
    "#define vi vector<int>",
    "#define vll vector<long long int>",
    "#define pii pair<int, int>",
    "#define pll pair<ll, ll>",
    "#define all(x) (x).begin(), (x).end()",
    "#define sz(x) (int)(x).size()",
    "",
    "// Constants",
    "const ll MOD = 1e9 + 7;",
    "const ll INF = 1e18;",
    "",
    "int main() {",
    "\tfast_io;",
    "\t// Solution code here",
    "\treturn 0;",
    "}",
  }
  vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
end, { desc = 'Insert C++ single-test template' })

-- ============================================================================
-- PYTHON TEMPLATE - Competitive Programming
-- ============================================================================

vim.api.nvim_create_user_command('Pytemp', function()
  if vim.bo.filetype ~= 'python' then
    print("Not a Python file")
    return
  end
  local template = {
    "import sys",
    "from collections import defaultdict, deque, Counter",
    "from bisect import bisect_left, bisect_right",
    "from math import gcd, lcm, isqrt",
    "",
    "# Fast input for competitive programming",
    "def input(): return sys.stdin.readline().strip()",
    "",
    "# Constants",
    "MOD = 10**9 + 7",
    "INF = 10**18",
    "",
    "# Utility Functions",
    "def gcd_list(lst):",
    "    from functools import reduce",
    "    return reduce(gcd, lst)",
    "",
    "def mod_pow(base, exp, mod):",
    "    result = 1",
    "    base %= mod",
    "    while exp > 0:",
    "        if exp & 1:",
    "            result = (result * base) % mod",
    "        base = (base * base) % mod",
    "        exp >>= 1",
    "    return result",
    "",
    "def solve():",
    "    # Solution code here",
    "    pass",
    "",
    "if __name__ == '__main__':",
    "    t = int(input())",
    "    for _ in range(t):",
    "        solve()",
  }
  vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
end, { desc = 'Insert Python competitive programming template' })

-- ============================================================================
-- PYTHON SINGLE-TEST TEMPLATE
-- ============================================================================

vim.api.nvim_create_user_command('Pytempone', function()
  if vim.bo.filetype ~= 'python' then
    print("Not a Python file")
    return
  end
  local template = {
    "import sys",
    "from collections import defaultdict, deque, Counter",
    "from bisect import bisect_left, bisect_right",
    "from math import gcd, lcm, isqrt",
    "",
    "# Fast input for competitive programming",
    "def input(): return sys.stdin.readline().strip()",
    "",
    "# Constants",
    "MOD = 10**9 + 7",
    "INF = 10**18",
    "",
    "if __name__ == '__main__':",
    "    # Solution code here",
    "    pass",
  }
  vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
end, { desc = 'Insert Python single-test template' })


-- Image Viewer
map('n', '<leader>i', '<cmd>ImageViewer image.jpg<CR>', { desc = 'Display image.jpg' })
