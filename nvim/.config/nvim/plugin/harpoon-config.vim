" Marks
nnoremap <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>ah :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>th :lua require("harpoon.mark").toggle_file()<CR>
nnoremap <leader>as :lua require("harpoon.mark").add_file(nil, "9")<CR>

" Send commands
nnoremap st1 :lua require("harpoon.term").sendCommand(1,1)<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>i<CR><c-\><c-n>
nnoremap stf :lua require("harpoon.term").sendCommand(1, "bundle exec rspec ".. vim.fn.getreg('%'))<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>i<CR><c-\><c-n>
nnoremap stl :lua require("harpoon.term").sendCommand(1, "bundle exec rspec ".. vim.fn.getreg('%') ..":".. vim.api.nvim_win_get_cursor(0)[1])<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>i<CR><c-\><c-n>
nnoremap stt :lua require("harpoon.term").sendCommand(1, "bundle exec rspec")<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>i<CR><c-\><c-n>

" Navigation
nnoremap gt :lua require("harpoon.term").gotoTerminal(1)<CR>

nnoremap g1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap g2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap g3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap g4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap g5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap g9 :lua require("harpoon.ui").nav_file(9)<CR>

nnoremap gn :lua require("harpoon.ui").nav_next()<CR>
nnoremap gp :lua require("harpoon.ui").nav_prev()<CR>

