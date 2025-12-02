call plug#begin()

Plug 'Mofiqul/vscode.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

call plug#end()

" Ctrl+s pour sauvegarder en mode normal
nnoremap <silent> <C-s> :w<CR>

" Ctrl+s pour sauvegarder en mode insertion
inoremap <silent> <C-s> <Esc>:w<CR>a

" Telescope keymaps
lua << EOF
local builtin = require('telescope.builtin')

require('telescope').setup{
  defaults = {
    layout_config = {
      horizontal = {
        preview_width = 0.5,  -- rétrécit la preview
      },
      vertical = {
        preview_height = 0.5, -- rétrécit la preview
      },
      width = 0.85,           -- largeur de la fenêtre Telescope
      height = 0.85,          -- hauteur
    },
  }
}

-- Ctrl+p for telescope 
vim.keymap.set('n', '<C-p>', function()
  local ok = pcall(builtin.git_files, { show_untracked = true })
  if not ok then
    builtin.find_files()
  end
end, { desc = 'Find files (git or all)' })

-- Ctrl+Shift+F for live_grep
vim.keymap.set('n', '<C-S-f>', function()
  builtin.live_grep()
end, { desc = 'Live grep search' })

EOF

set clipboard=unnamedplus
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
