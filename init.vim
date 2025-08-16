call plug#begin()

Plug 'Mofiqul/vscode.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

call plug#end()

" Telescope keymaps
lua << EOF
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', function()
  local ok = pcall(builtin.git_files, { show_untracked = true })
  if not ok then
    builtin.find_files()
  end
end, { desc = 'Find files (git or all)' })
EOF

set clipboard=unnamedplus
