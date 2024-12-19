local M = {}

local ripgrep = {
    "rg",
}

---@param opts table
---@return string
M.rg_gitwords = function(opts)
    opts = opts or { hidden = false }

    local command = ripgrep

    if opts.hidden then
        table.insert(command, "--hidden")
    end

    local extends = {
        "--vimgrep",
        "--no-heading",
        "--line-number",
        "--column",
        "--smart-case",
    }

    for _, v in ipairs(extends) do
        table.insert(command, v)
    end

    return table.concat(command, " ")
end

return M
