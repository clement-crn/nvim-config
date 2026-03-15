call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'neovim/nvim-lspconfig'
call plug#end()

" Ctrl+s pour sauvegarder en mode normal
nnoremap <silent> <C-s> :w<CR>
" Ctrl+s pour sauvegarder en mode insertion
inoremap <silent> <C-s> <Esc>:w<CR>a

lua << EOF
local builtin = require('telescope.builtin')
require('telescope').setup{
  defaults = {
    layout_config = {
      horizontal = {
        preview_width = 0.5,
      },
      vertical = {
        preview_height = 0.5,
      },
      width = 0.85,
      height = 0.85,
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

-- ge pour afficher le popup de l'erreur
vim.keymap.set('n', 'ge', vim.diagnostic.open_float, { desc = 'Show error popup' })

-- gn pour aller à l'erreur suivante (next)
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, { desc = 'Next error' })
-- gp pour aller à l'erreur précédente (previous)
vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, { desc = 'Previous error' })

-- Active le LSP TypeScript

