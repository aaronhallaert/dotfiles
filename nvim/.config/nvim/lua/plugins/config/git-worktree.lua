local Worktree = require("git-worktree")
local Job = require("plenary.job")

-- vim.g.git_worktree_log_level='debug'

Worktree.setup()

vim.api.nvim_set_keymap(
    "n",
    "<leader>wt",
    ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>awt",
    ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>',
    { noremap = true }
)
-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted
--
-- local function is_yarn_folder()
--     return not not (string.find(vim.loop.cwd(), "electron-apps", 1, true))
-- end
--
Worktree.on_tree_change(function(op, _)
    if
        op == (Worktree.Operations.Switch or Worktree.Operations.Create)
        and string.find(vim.fn.getcwd(), "nephroflow%-api")
    then
        local command = "run_api -n -- pkill ruby"
        local splitted_command = {}
        for str in command:gmatch("[^ ]+") do
            table.insert(splitted_command, str)
        end
        -- local first_command = table.remove(splitted_command, 1)
        local args = splitted_command

        Job:new({
            command = "bash",
            args = args,
            on_exit = function(j, return_val)
                print(vim.inspect(return_val))
                print(vim.inspect(j:result()))
            end,
        }):start()
    end
end)
