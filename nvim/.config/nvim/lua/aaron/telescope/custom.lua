local actions = require('telescope.actions')
local action_state = require "telescope.actions.state"

local M = {}

local function changed_on_branch()
    local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')

    pickers.new {
        results_title = 'Modified on current branch',
        finder = finders.new_oneshot_job({'git-branch-modified.sh', 'list'}),
        sorter = sorters.get_fuzzy_file(),
        previewer = previewers.new_termopen_previewer {
            get_command = function(entry)
                return {'git-branch-modified.sh', 'diff', entry.value}
            end
        }
    }:find()
end

function Get_commit_hash(commit_log)
    Splitted_commit = {}
    Count = 1
    for i in string.gmatch(commit_log, "%S+") do
        Splitted_commit[Count] = i
        Count = Count + 1
    end
    return Splitted_commit[1]
end

-- Compare current file with file on a specific branch
-- Lists local branches
local function diff_file_branch()
    -- local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    local c_branch = vim.fn.system('git branch --show-current')
    c_branch = string.gsub(c_branch, "\n", "")
    pickers.new {
        results_title = 'Local branches :: ' .. c_branch,
        finder = finders.new_oneshot_job({
            'git', 'branch', "--format=%(refname:short)"
        }),
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(_, map)

            map('i', '<CR>', function(prompt_bufnr)
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local branch = selection.value
                print(branch)

                vim.api.nvim_command(":Gvdiffsplit " .. branch)
            end)

            return true
        end
    }:find()
end

-- Compare file with selected commit
-- Lists commit history of current file
local function diff_file_log()
    local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    local file_name = vim.fn.expand('%')
    local s_start = vim.fn.getpos("'<")[2]
    local s_end = vim.fn.getpos("'>")[2]
    local location = string.format("-L%d,%d:%s", s_start, s_end, file_name)

    -- git log -L741,751:'app/models/patients/patient.rb' --format='%C(auto)%h \t %as \t %C(green)%an -- %Creset %s'
    pickers.new {
        results_title = 'Commits on selected lines, <CR> to compare to current',
        -- finder = finders.new_oneshot_job({'git', 'log', '--pretty=oneline', '--', file_name}),
        finder = finders.new_oneshot_job({
            'git', 'log', location,
            "--format=%C(auto)%h %as %C(green)%an -- %Creset %s", "-s"
        }),
        -- finder = finders.new_oneshot_job({'git', 'log', location}),
        previewer = previewers.new_termopen_previewer {
            get_command = function(entry)
                local commit_hash = Get_commit_hash(entry.value)
                return {
                    'git', 'diff', string.format("%s~", commit_hash),
                    commit_hash, '--', file_name
                }
            end
        },
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local commit_log = selection.value

                vim.api.nvim_command(":Gvdiffsplit " ..
                                         Get_commit_hash(commit_log))
            end)
            map('i', '<C-o>', function(prompt_bufnr)
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local commit = selection.value

                vim.api.nvim_command(":GBrowse " .. Get_commit_hash(commit))
            end)

            return true
        end
    }:find()
end

local function diff_entire_file_log()
    local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    local file_name = vim.fn.expand('%')
    print(file_name)

    pickers.new {
        results_title = 'Commits history for entire file',
        -- finder = finders.new_oneshot_job({'git', 'log', '--pretty=oneline', '--', file_name}),
        finder = finders.new_oneshot_job({
            'git', 'log', "--format=%C(auto)%h %as %C(green)%an -- %Creset %s",
            "-s", '--follow', file_name
        }),
        -- finder = finders.new_oneshot_job({'git', 'log', location}),
        previewer = previewers.new_termopen_previewer {
            get_command = function(entry)
                local commit_hash = Get_commit_hash(entry.value)
                return {
                    'git', 'diff', string.format("%s~", commit_hash),
                    commit_hash
                }
            end
        },
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local commit_log = selection.value
                local commit_hash = Get_commit_hash(commit_log)

                local command = {
                    'git', 'diff', string.format("%s~", commit_hash),
                    commit_hash, "\n"
                }

                vim.api.nvim_command('split new') -- split a new window
                vim.api.nvim_win_set_height(0, 30) -- set the window height
                local buf_handle = vim.api.nvim_win_get_buf(0) -- get the buffer handler
                local jobID = vim.api.nvim_call_function("termopen", {"$SHELL"})
                vim.api.nvim_buf_set_option(buf_handle, 'modifiable', true)
                vim.api.nvim_chan_send(jobID, table.concat(command, " "))

            end)
            map('i', '<C-o>', function(prompt_bufnr)
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local commit = selection.value

                vim.api.nvim_command(":GBrowse " .. Get_commit_hash(commit))
            end)

            return true
        end
    }:find()
end

-- Compare file with selected commit
-- Lists commit history
local function diff_file_commit()
    local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    local c_branch = vim.fn.system('git branch --show-current')
    local file_name = vim.fn.expand('%')
    c_branch = string.gsub(c_branch, "\n", "")
    pickers.new {
        results_title = 'Last commits on current file compared to ' .. c_branch,
        finder = finders.new_oneshot_job({
            'git', 'log',
            "--format=%C(auto)%h \t %as \t %C(green)%an -- %Creset %s", "--",
            file_name
        }),
        -- finder = finders.new_oneshot_job({'git', 'cherry', '-v', 'master', c_branch}),
        sorter = sorters.get_fuzzy_file(),
        previewer = previewers.new_termopen_previewer {
            get_command = function(entry)
                return {
                    'git', 'diff', Get_commit_hash(entry.value), '--', file_name
                }
            end
        },
        attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local commit = selection.value

                vim.api.nvim_command(":Gvdiffsplit " .. Get_commit_hash(commit))
            end)
            map('i', '<C-o>', function(prompt_bufnr)
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local commit = selection.value

                vim.api.nvim_command(":GBrowse " .. Get_commit_hash(commit))
            end)

            return true
        end
    }:find()
end

local function checkout_reflog()
    -- local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    pickers.new {
        results_title = 'Git Reflog, <CR> to checkout',
        finder = finders.new_oneshot_job({'git', 'reflog', '--date=iso'}),
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local reflog_entry = selection.value

                Splitted_reflog_entry = {}
                Count = 1
                for i in string.gmatch(reflog_entry, "%S+") do
                    Splitted_reflog_entry[Count] = i
                    Count = Count + 1
                end
                vim.api.nvim_command(":!git checkout " ..
                                         Splitted_reflog_entry[1])
            end)

            return true
        end
    }:find()
end

local function map_item(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do t[k] = f(v) end
    return t
end

local git_functions = {
    {value = "Diff file with branch", func = diff_file_branch},
    {value = "Diff file with previous commit", func = diff_file_commit},
    {value = "Diff file with line history", func = diff_file_log},
    {value = "Diff file with file history", func = diff_entire_file_log},
    {value = "Checkout from reflog", func = checkout_reflog},
    {value = "Show (git add) changes on branch", func = changed_on_branch}
}

local function execute_git_function(value)
    for _, v in pairs(git_functions) do
        if v["value"] == value then
            v["func"]()
            return
        end
    end

end

function M.show_custom_functions()
    -- local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    pickers.new {
        results_title = 'Git action',
        finder = finders.new_table(map_item(git_functions, function(item)
            return item["value"]
        end)),
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                execute_git_function(selection.value)
            end)

            return true
        end
    }:find()
end

return M
