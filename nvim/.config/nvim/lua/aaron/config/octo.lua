require("octo").setup()

vim.api.nvim_set_keymap('n', '<leader>rt', ':Octo thread resolve<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>spr',
                        ':Octo search author:aaronhallaert is:pr is:open<CR>',
                        {noremap = true})

local function get_octo_buffer()
    local octo_buffer;
    for buffer = 1, vim.fn.bufnr('$') do
        local buffer_name = vim.fn.bufname(buffer)
        if string.match(buffer_name, "octo://") then
            octo_buffer = buffer
            break
        end
    end

    return octo_buffer;
end

function _G.ShowCurrentPR()
    local octo_buffer = get_octo_buffer()
    print(octo_buffer)
    if octo_buffer then
        -- vim.fn.bufload(octo_buffer)
        vim.cmd("b" .. octo_buffer)
    else
        local baseCommit = vim.fn.system('git rev-parse --abbrev-ref HEAD')
        vim.cmd("Octo search is:pr head:" .. baseCommit)
    end

end

vim.api.nvim_set_keymap('n', '<leader>pr', ':lua ShowCurrentPR()<CR>',
                        {noremap = true})
