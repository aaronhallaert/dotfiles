local harpoon = require("harpoon")

harpoon.setup({})

-- Marks
vim.api.nvim_set_keymap('n', '<C-h>',
                        ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ah',
                        ':lua require("harpoon.mark").add_file()<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>th',
                        ':lua require("harpoon.mark").toggle_file()<CR>',
                        {noremap = true})

-- Send commands
vim.api.nvim_set_keymap('n', 'st1',
                        ':lua require("harpoon.term").sendCommand(1,1)<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>i<CR><c-\\><c-n>',
                        {noremap = true})

function _G.Get_test_command( --[[optional]] line)
    local test_file = vim.fn.getreg('%')
    local test_line = vim.api.nvim_win_get_cursor(0)[1]
    local test_position = test_file .. ":" .. test_line

    if not line then line = false end

    if line then
        return "bundle exec rspec " .. test_position
    else
        return "bundle exec rspec " .. test_file
    end
end

function _G.Run_command_in_terminal(command)
    require("harpoon.term").sendCommand(1, "run_api.sh '" .. command .. "'")
    require("harpoon.term").gotoTerminal(1)
end

vim.api.nvim_set_keymap('n', 'stf',
                        ':lua Run_command_in_terminal(Get_test_command(false))<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'stl',
                        ':lua Run_command_in_terminal(Get_test_command(true))<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'stt',
                        ':lua Run_command_in_terminal("bundle exec rspec")<CR>',
                        {noremap = true})

-- Navigation
vim.api.nvim_set_keymap('n', 'gt',
                        ':lua require("harpoon.term").gotoTerminal(1)<CR>',
                        {noremap = true})

vim.api.nvim_set_keymap('n', 'g1', ':lua require("harpoon.ui").nav_file(1)<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'g2', ':lua require("harpoon.ui").nav_file(2)<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'g3', ':lua require("harpoon.ui").nav_file(3)<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'g4', ':lua require("harpoon.ui").nav_file(4)<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'g5', ':lua require("harpoon.ui").nav_file(5)<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'g6', ':lua require("harpoon.ui").nav_file(6)<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'g7', ':lua require("harpoon.ui").nav_file(7)<CR>',
                        {noremap = true})

vim.api.nvim_set_keymap('n', 'gn', ':lua require("harpoon.ui").nav_next()<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'gp', ':lua require("harpoon.ui").nav_prev()<CR>',
                        {noremap = true})
