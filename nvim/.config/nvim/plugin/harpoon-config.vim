nnoremap <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap gt1 :lua require("harpoon.term").gotoTerminal(1)<CR>i
nnoremap gt2 :lua require("harpoon.term").gotoTerminal(2)<CR>i
nnoremap st11 :lua require("harpoon.term").sendCommand(1,1)<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>i<CR><c-\><c-n>
nnoremap st1f :lua require("harpoon.term").sendCommand(1, "bundle exec rspec ".. vim.fn.getreg('%'))<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>i<CR><c-\><c-n>
nnoremap st1l :lua require("harpoon.term").sendCommand(1, "bundle exec rspec ".. vim.fn.getreg('%') ..":".. vim.api.nvim_win_get_cursor(0)[1])<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>i<CR><c-\><c-n>
nnoremap g1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap g2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap g3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap g4 :lua require("harpoon.ui").nav_file(4)<CR>

