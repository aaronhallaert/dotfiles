local actions = require('telescope.actions')
local action_set = require "telescope.actions.set"
local action_state = require "telescope.actions.state"

require('telescope').setup {
    defaults = {
        -- prompt_prefix = "> ",
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        mappings = {
            i = {["<c-s>"] = actions.send_selected_to_qflist + actions.open_qflist, ["<c-a>"] = actions.add_selected_to_qflist + actions.open_qflist},
            n = {["<c-s>"] = actions.send_selected_to_qflist + actions.open_qflist, ["<c-a>"] = actions.add_selected_to_qflist + actions.open_qflist}
        }
    },
    extensions = {fzy_native = {override_generic_sorter = false, override_file_sorter = true}},
    pickers = {
        buffers = {
            sort_lastused = true,
            mappings = {i = {["<c-d>"] = require("telescope.actions").delete_buffer}, n = {["<c-d>"] = require("telescope.actions").delete_buffer}}
        }
    }
}

require("telescope").load_extension("fzy_native")

local M = {}
function M.search_dotfiles()
    require("telescope.builtin").find_files({
        hidden = true,
        prompt_prefix = " ⚙  ",
        prompt_title = "< dotfiles >",
        cwd = "$HOME/dotfiles/nvim/.config/nvim"
    })
end

function M.search_dotfiles_words()
    require("telescope.builtin").live_grep({
        find_command = rg,
        hidden = true,
        prompt_prefix = " ⚙  ",
        prompt_title = "< dotfiles words >",
        cwd = "$HOME/dotfiles/nvim/.config/nvim"
    })
end

function M.search_gitwords()
    require("telescope.builtin").live_grep({
        hidden = true,
        prompt_prefix = "   ",
        prompt_title = "< project words >",
        find_command = rg,
        cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    })
end

function M.search_git_files()
    require("telescope.builtin").git_files({hidden = true, prompt_prefix = "   ", prompt_title = "< project files >", find_command = rg})
end

function M.changed_on_branch()
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

function M.diff_file_branch()
    -- local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    local c_branch = vim.fn.system('git branch --show-current')
    c_branch = string.gsub(c_branch, "\n", "")
    pickers.new {
        results_title = 'Local branches :: ' .. c_branch,
        finder = finders.new_oneshot_job({'git', 'branch', "--format=%(refname:short)"}),
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

function M.diff_file_commit()
    -- local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    local c_branch = vim.fn.system('git branch --show-current')
    c_branch = string.gsub(c_branch, "\n", "")
    pickers.new {
        results_title = 'Last 100 commits from :: ' .. c_branch,
        finder = finders.new_oneshot_job({'git', 'log', '-100', "--format=%C(auto)%H \t %as \t %C(green)%an -- %Creset %s"}),
        -- finder = finders.new_oneshot_job({'git', 'cherry', '-v', 'master', c_branch}),
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local commit = selection.value

                Splitted_commit = {}
                Count = 1
                for i in string.gmatch(commit, "%S+") do
                    Splitted_commit[Count] = i
                    Count = Count + 1
                end
                vim.api.nvim_command(":Gvdiffsplit " .. Splitted_commit[1])
            end)

            return true
        end
    }:find()
end

return M
