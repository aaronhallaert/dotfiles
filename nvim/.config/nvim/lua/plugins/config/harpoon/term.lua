local M = {}
local harpoon = require("harpoon")
---@type HarpoonList
local term_list = harpoon:list("terms")

---@return string name of the created terminal
M.create_terminal = function()
    vim.cmd("terminal")
    local buf_id = vim.api.nvim_get_current_buf()
    return vim.api.nvim_buf_get_name(buf_id)
end

---@param index number: The index of the terminal to select.
M.select_term = function(index)
    vim.print("termlist:", term_list:length())

    if index > term_list:length() or term_list.items[index] == nil then
        M.create_terminal()
        -- just append the newly open terminal
        term_list:add()
    else
        -- find in list
        term_list:select(index)
    end
end

-- TODO this wont work when term gets deleted by telescope
M.remove_closed_terms = function()
    local to_delete = {}
    for _, term in ipairs(term_list.items) do
        local bufnr = vim.fn.bufnr(term.value)
        if bufnr == -1 then
            table.insert(to_delete, term)
        end
    end

    for _, term in ipairs(to_delete) do
        term_list:remove(term)
    end
end

M.run_command_in_terminal = function(
    command, --[[optional]]
    term
)
    if not term then
        term = 1
    end

    M.select_term(term)
    vim.api.nvim_command("startinsert")
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes(command .. "<CR>", true, true, true),
        "n",
        true
    )
end


---@class KeymapOverride
---@field pattern string
---@field actions table<string,string>

---@class Keymap
---@field default table<string,string>
---@field overrides KeymapOverride[]

---@class Keymaps
---@field stl Keymap
---@field stf Keymap

---@param keymaps Keymaps
M.apply_keymaps = function(keymaps)
    for keys, mappings in pairs(keymaps) do
        ---@cast mappings Keymap

        vim.keymap.set("n", keys, function()
            local cwd = vim.fn.getcwd()

            local matched_actions = nil
            --- search the correct mapping
            for _, mapping in ipairs(mappings.overrides) do
                if string.find(cwd, mapping.pattern) then
                    matched_actions = mapping.actions
                    goto actions_found
                end
            end
            ::actions_found::

            local final_actions = vim.tbl_extend("force", mappings.default, matched_actions or {})

            if final_actions == nil then
                vim.notify("No keymaps found for current directory: ".. cwd, vim.log.levels.ERROR)
                return
            end

            local current_filetype = vim.bo.filetype
            local final_action = final_actions[current_filetype]

            if final_action == nil then
                vim.notify("No keymaps found for current filetype "..current_filetype, vim.log.levels.ERROR)
                return
            end

            local cmd = string.gsub(final_action, "%%file", vim.fn.expand("%"))
            cmd = string.gsub(cmd, "%%word", vim.fn.expand("<cword>"))
            cmd = string.gsub(cmd, "%%line", vim.fn.line("."))

            M.run_command_in_terminal(cmd)
        end, { noremap = true, silent = true })
    end
end

-- Autocommand to remove closed terminal from the list

-- "VimEnter" cleans terminals that were saved when you closed vim for the last time but were not removed
vim.api.nvim_create_autocmd({ "TermClose", "VimEnter" }, {
    pattern = "*",
    callback = M.remove_closed_terms,
})

-- This is needed because closing term with bd! won't trigger "TermClose"
vim.api.nvim_create_autocmd({ "BufDelete", "BufUnload" }, {
    pattern = "term://*",
    callback = M.remove_closed_terms,
})

vim.keymap.set("n", "gt", function()
    M.select_term(1)
end)

-- Command that I use for debugging
vim.api.nvim_create_user_command("HarpoonShowTermList", function()
    harpoon.ui:toggle_quick_menu(term_list)
end, {})

return M
