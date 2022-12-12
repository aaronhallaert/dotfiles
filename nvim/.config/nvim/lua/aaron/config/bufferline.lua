require("bufferline").setup({
    -- options = {
    -- sort_by = function(buffer_a, buffer_b)
    -- local buffer_a_file = vim.fn.expand("#" .. buffer_a.id .. ":f")
    -- local buffer_b_file = vim.fn.expand("#" .. buffer_b.id .. ":f")
    --     local buffer_a_file = buffer_a.filename
    --     local buffer_b_file = buffer_b.filename
    --     local buffer_a_index = -1
    --     local buffer_b_index = -1
    --
    --     for index, buffer in
    --         ipairs(vim.split(vim.fn.execute(":buffers! t"), "\n"))
    --     do
    --         -- stop searching if both buffers are found
    --         if buffer_a_index ~= -1 and buffer_b_index ~= -1 then
    --             break
    --         end
    --
    --         if string.find(buffer, buffer_a_file) then
    --             buffer_a_index = index
    --         end
    --
    --         if string.find(buffer, buffer_b_file) then
    --             buffer_b_index = index
    --         end
    --     end
    --
    --     return buffer_a_index < buffer_b_index
    -- end,
    -- },
})

vim.api.nvim_set_keymap(
    "n",
    "<leader>hf",
    ":BufferLinePick<CR>",
    { noremap = true }
)
