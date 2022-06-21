local actions = require('telescope.actions')
local action_set = require "telescope.actions.set"
local action_state = require "telescope.actions.state"

require('telescope').setup {
    defaults = {
        -- prompt_prefix = "> ",
        vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"},
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {prompt_position = "top", preview_width = 0.55, results_width = 0.8},
            vertical = {mirror = false},
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120
        },
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        file_ignore_patterns = {"node_modules"},
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = {"truncate"},
        winblend = 0,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
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
require("telescope").load_extension("ui-select")

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
        results_title = 'Last commits from :: ' .. c_branch,
        finder = finders.new_oneshot_job({'git', 'log', "--format=%C(auto)%H \t %as \t %C(green)%an -- %Creset %s"}),
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

function M.checkout_reflog()
    -- local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    pickers.new {
        results_title = 'Git Reflog',
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
                vim.api.nvim_command(":!git checkout " .. Splitted_reflog_entry[1])
            end)

            return true
        end
    }:find()
end

return M
