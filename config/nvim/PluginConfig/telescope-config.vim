lua << EOF

search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/dotfiles/config/nvim",
    })
end

search_dotfiles_words = function()
    require("telescope.builtin").live_grep({
        prompt_title = "< VimRC >",
        cwd = "$HOME/dotfiles/config/nvim",
    })
end

EOF

nnoremap <leader>ff <cmd>Telescope git_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>
nnoremap <leader>fg <cmd>Telescope live_grep <cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>src :lua search_dotfiles_words()<CR>
nnoremap <leader>frc :lua search_dotfiles()<CR>
