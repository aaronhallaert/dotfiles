"nnoremap <leader>ff <cmd>lua require("aaron.telescope").search_git_files()<cr>
nnoremap <leader>ff <cmd>Files<cr>
"nnoremap <leader>fg <cmd>lua require("aaron.telescope").search_gitwords()<cr>
nnoremap <leader>fg <cmd>Rg<cr>


nnoremap <leader>fb <cmd>lua require("telescope.builtin").buffers()<cr>
nnoremap <leader>fh <cmd>lua require("telescope.builtin").help_tags()<cr>
nnoremap <leader>gs <cmd>lua require("telescope.builtin").git_status()<cr>
nnoremap <leader>gc <cmd>lua require("aaron.telescope").changed_on_branch()<cr>

nnoremap <leader>vrc :lua require('aaron.telescope').search_dotfiles_words()<CR>
nnoremap <leader>frc :lua require('aaron.telescope').search_dotfiles()<CR>
nnoremap <leader>fcb :Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>

" Use local quickfix list for LSP errors
nnoremap <localleader>j :cnext<CR>zz
nnoremap <localleader>k :cprev<CR>zz
nnoremap <localleader>q :copen<CR>
nnoremap <C-j> :lnext<CR>zz
nnoremap <C-k> :lprev<CR>zz
