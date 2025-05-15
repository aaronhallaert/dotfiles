local M = {}

local ripgrep = {
    "rg",
}

---@param opts? table
---@return string
M.rg_gitwords = function(opts)
    opts = opts or { hidden = false, ignore = false }

    local command = ripgrep

    if opts.hidden then
        table.insert(command, "--hidden")
    end

    if opts.ignore then
        table.insert(command, "--no-ignore")
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
