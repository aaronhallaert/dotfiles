local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local N = {}

-- open diff for current file
-- @param commit (string) commit or branch to diff with
local function open_diff_view(
    commit, --[[optional]]
    file_name
)
    if file_name ~= nil and file_name ~= "" then
        vim.api.nvim_command(":Gvdiffsplit " .. commit .. ":" .. file_name)
    else
        vim.api.nvim_command(":Gvdiffsplit " .. commit)
    end
end

local function determine_file_name(commit_hash, current_file_name)
    local command = "git log -M --diff-filter=R --follow --name-status --summary "
        .. commit_hash
        .. ".. -- "
        .. current_file_name
        .. " | grep ^R | tail -1 | cut -f2,2"

    local handle = io.popen(command)
    local output = handle:read("*a")
    handle:close()

    output = string.gsub(output, "\n", "")
    if output == "" then
        output = current_file_name
    end
    return output
end

-- returns the base branch of a branch (where fork_point is)
local function base_branch()
    local command =
        'git show-branch | sed "s/].*//" | grep "*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\\[//"'
    -- local command =
    --     'git show-branch | sed "s/].*//" | grep "*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*[//"'
    local handle = io.popen(command)
    local output = handle:read("*a")
    handle:close()

    output = string.gsub(output, "\n", "")
    return output
end

-- returns the commit hash from the commit log
local get_commit_hash = function(commit_log)
    local splitted_commit = {}
    local count = 1
    for i in string.gmatch(commit_log, "%S+") do
        splitted_commit[count] = i
        count = count + 1
    end
    return splitted_commit[1]
end

-- Opens a Telescope window with all files changed on the current branch
-- Only committed changes will be displayed
--
-- <CR> to open the file
-- <C-d> to open a diff with the base branch
local function changed_on_branch()
    local previewers = require("telescope.previewers")
    local pickers = require("telescope.pickers")
    local sorters = require("telescope.sorters")
    local finders = require("telescope.finders")

    pickers
        .new({
            results_title = "Modified on current branch",
            finder = finders.new_oneshot_job(vim.tbl_flatten({
                "bash",
                "git-branch-modified.sh",
                "list",
            })),
            sorter = sorters.get_fuzzy_file(),
            previewer = previewers.new_termopen_previewer({
                get_command = function(entry, _)
                    return {
                        "bash",
                        "git-branch-modified.sh",
                        "diff",
                        entry.value,
                    }
                end,
            }),
            attach_mappings = function(_, map)
                map("i", "<C-d>", function(prompt_bufnr)
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local file = selection.value
                    vim.cmd(":edit " .. file)
                    open_diff_view(base_branch())
                end)

                return true
            end,
        })
        :find()
end

-- Opens a Telescope window with a list of local branches
--
-- <CR> opens a diff for the current file with the selected branch
local function diff_file_branch()
    -- local previewers = require('telescope.previewers')
    local pickers = require("telescope.pickers")
    local sorters = require("telescope.sorters")
    local finders = require("telescope.finders")
    local c_branch = vim.fn.system("git branch --show-current")
    c_branch = string.gsub(c_branch, "\n", "")
    local file_name = vim.fn.expand("%")
    pickers
        .new({
            results_title = "Local branches :: " .. c_branch,
            finder = finders.new_oneshot_job({
                "git",
                "branch",
                "--format=%(refname:short)",
            }),
            sorter = sorters.get_fuzzy_file(),
            attach_mappings = function(_, map)
                map("i", "<CR>", function(prompt_bufnr)
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local branch = selection.value

                    open_diff_view(
                        branch,
                        determine_file_name(branch, file_name)
                    )
                end)

                return true
            end,
        })
        :find()
end

-- Opens a Telescope window with a list of previous commit logs with respect to selected lines
--
-- <CR> opens a diff for the current file with the selected commit
-- <C-o> opens a the selected commit in the browser
local function diff_file_log()
    local previewers = require("telescope.previewers")
    local pickers = require("telescope.pickers")
    local sorters = require("telescope.sorters")
    local finders = require("telescope.finders")
    local file_name = vim.fn.expand("%")
    local relative_file_name = vim.fn.expand("%:f")
    local s_start = vim.fn.getpos("'<")[2]
    local s_end = vim.fn.getpos("'>")[2]
    local location =
        string.format("-L%d,%d:%s", s_start, s_end, relative_file_name)

    -- git log -L741,751:'app/models/patients/patient.rb' --format='%C(auto)%h \t %as \t %C(green)%an -- %Creset %s'
    pickers
        .new({
            results_title = "Commits on selected lines, <CR> to compare to current",
            -- finder = finders.new_oneshot_job({'git', 'log', '--pretty=oneline', '--', file_name}),
            finder = finders.new_oneshot_job({
                "git",
                "log",
                location,
                "--format=%C(auto)%h %as %C(green)%an -- %Creset %s",
                "-s",
            }),
            -- finder = finders.new_oneshot_job({'git', 'log', location}),
            previewer = previewers.new_termopen_previewer({
                get_command = function(entry)
                    local commit_hash = get_commit_hash(entry.value)
                    return {
                        "git",
                        "diff",
                        string.format("%s~", commit_hash),
                        commit_hash,
                        "--",
                        file_name,
                    }
                end,
            }),
            sorter = sorters.get_fuzzy_file(),
            attach_mappings = function(_, map)
                map("i", "<CR>", function(prompt_bufnr)
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local commit_log = selection.value
                    local commit_hash = get_commit_hash(commit_log)

                    open_diff_view(commit_hash)
                end)
                map("i", "<C-o>", function(prompt_bufnr)
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local commit = selection.value

                    vim.api.nvim_command(":GBrowse " .. get_commit_hash(commit))
                end)

                return true
            end,
        })
        :find()
end

-- Opens a Telescope window with a list of git commits which changed the current file (renames included)
--
-- <CR> Opens a diff of the current file with the selected commit
-- <C-e> Opens an entire git diff of the selected commit
-- <C-o> Open the selected commit in the browser
local function diff_file_commit()
    local previewers = require("telescope.previewers")
    local pickers = require("telescope.pickers")
    local sorters = require("telescope.sorters")
    local finders = require("telescope.finders")
    local file_name = vim.fn.expand("%")

    pickers
        .new({
            results_title = "Commits history for entire file",
            -- finder = finders.new_oneshot_job({'git', 'log', '--pretty=oneline', '--', file_name}),
            finder = finders.new_oneshot_job({
                "git",
                "log",
                "--format=%C(auto)%h %as %C(green)%an -- %Creset %s",
                "-s",
                "--follow",
                file_name,
            }),
            -- finder = finders.new_oneshot_job({'git', 'log', location}),
            previewer = previewers.new_termopen_previewer({
                get_command = function(entry)
                    local commit_hash = get_commit_hash(entry.value)

                    local prev_commit = string.format("%s~", commit_hash)
                    return {
                        "git",
                        "diff",
                        prev_commit
                            .. ":"
                            .. determine_file_name(prev_commit, file_name),
                        commit_hash
                            .. ":"
                            .. determine_file_name(commit_hash, file_name),
                    }
                end,
            }),
            sorter = sorters.get_fuzzy_file(),
            attach_mappings = function(_, map)
                map("i", "<CR>", function(prompt_bufnr)
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local commit_log = selection.value
                    local commit_hash = get_commit_hash(commit_log)
                    local old_file_name =
                        determine_file_name(commit_hash, file_name)

                    open_diff_view(commit_hash, old_file_name)
                end)
                map("i", "<C-e>", function(prompt_bufnr)
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local commit_log = selection.value
                    local commit_hash = get_commit_hash(commit_log)

                    local command = {
                        "git",
                        "diff",
                        string.format("%s~", commit_hash),
                        commit_hash,
                        "\n",
                    }

                    vim.api.nvim_command("split new") -- split a new window
                    vim.api.nvim_win_set_height(0, 30) -- set the window height
                    local buf_handle = vim.api.nvim_win_get_buf(0) -- get the buffer handler
                    local jobID =
                        vim.api.nvim_call_function("termopen", { "$SHELL" })
                    vim.api.nvim_buf_set_option(buf_handle, "modifiable", true)
                    vim.api.nvim_chan_send(jobID, table.concat(command, " "))
                end)
                map("i", "<C-o>", function(prompt_bufnr)
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local commit = selection.value
                    local commit_hash = get_commit_hash(commit)

                    vim.api.nvim_command(":GBrowse " .. commit_hash)
                end)

                return true
            end,
        })
        :find()
end

-- Opens a Telescope window with all reflog entries
--
-- <CR> checkout on the reflog entry
local function checkout_reflog()
    -- local previewers = require('telescope.previewers')
    local pickers = require("telescope.pickers")
    local sorters = require("telescope.sorters")
    local finders = require("telescope.finders")
    pickers
        .new({
            results_title = "Git Reflog, <CR> to checkout",
            finder = finders.new_oneshot_job({ "git", "reflog", "--date=iso" }),
            sorter = sorters.get_fuzzy_file(),
            attach_mappings = function(_, map)
                map("i", "<CR>", function(prompt_bufnr)
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local reflog_entry = selection.value

                    Splitted_reflog_entry = {}
                    Count = 1
                    for i in string.gmatch(reflog_entry, "%S+") do
                        Splitted_reflog_entry[Count] = i
                        Count = Count + 1
                    end
                    vim.api.nvim_command(
                        ":!git checkout " .. Splitted_reflog_entry[1]
                    )
                end)

                return true
            end,
        })
        :find()
end

local function map_item(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

local git_functions = {
    { value = "Diff file with branch", func = diff_file_branch },
    { value = "Diff file with previous commit", func = diff_file_commit },
    { value = "Diff file with line history", func = diff_file_log },
    { value = "Checkout from reflog", func = checkout_reflog },
    { value = "Show changes on branch", func = changed_on_branch },
}

local function execute_git_function(value)
    for _, v in pairs(git_functions) do
        if v["value"] == value then
            v["func"]()
            return
        end
    end
end

function N.merge(M)
    function M.show_custom_functions()
        -- local previewers = require('telescope.previewers')
        local pickers = require("telescope.pickers")
        local sorters = require("telescope.sorters")
        local finders = require("telescope.finders")
        pickers
            .new({
                results_title = "Git action",
                finder = finders.new_table(
                    map_item(git_functions, function(item)
                        return item["value"]
                    end)
                ),
                sorter = sorters.get_fuzzy_file(),
                attach_mappings = function(_, map)
                    map("i", "<CR>", function(prompt_bufnr)
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry()
                        execute_git_function(selection.value)
                    end)

                    return true
                end,
            })
            :find()
    end
    return M
end

return N
