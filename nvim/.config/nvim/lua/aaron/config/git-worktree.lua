local Worktree = require("git-worktree")
local Job = require("plenary.job")

vim.g.git_worktree_log_level='debug'

Worktree.setup()

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
local function is_yarn_folder()
    return not not (string.find(vim.loop.cwd(), "electron-apps", 1, true))
end

Worktree.on_tree_change(function(op, metadata)
  if op == Worktree.Operations.Create and is_yarn_folder() then
      local cwd =vim.loop.cwd() .. '/' .. metadata.path
      Job:new({
          command = "yarn",
          args = {"install"},
          cwd = cwd,
          on_exit = function(j, return_val)
            print(cwd)
            print(return_val)
            print(j:result())
          end,
      }):start()
  end
end)

