local actions = require('telescope.actions')
require('telescope').setup{
   defaults = {
       --prompt_prefix = "> ",
       mappings = {
          i = {
            ["<c-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<c-a>"] = actions.add_selected_to_qflist + actions.open_qflist,
          },
          n = {
            ["<c-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<c-a>"] = actions.add_selected_to_qflist + actions.open_qflist,
          },
       },
   },
   pickers = {
       buffers = {
          sort_lastused = true,
          mappings = {
              i = {
                  ["<c-d>"] = require("telescope.actions").delete_buffer,
              },
              n = {
                  ["<c-d>"] = require("telescope.actions").delete_buffer,
              }
          }
      }
   }
}

local M = {}
function M.search_dotfiles()
    require("telescope.builtin").find_files({
        hidden = true,
        prompt_prefix = " ⚙  ",
        prompt_title = "< dotfiles >",
        cwd = "$HOME/dotfiles/nvim/.config/nvim",
    })
end

function M.search_dotfiles_words()
    require("telescope.builtin").live_grep({
        find_command=rg,
        hidden = true,
        prompt_prefix = " ⚙  ",
        prompt_title = "< dotfiles words >",
        cwd = "$HOME/dotfiles/nvim/.config/nvim",
    })
end

function M.search_gitwords()
    require("telescope.builtin").live_grep({
        hidden = true,
        prompt_prefix = "   ",
        prompt_title = "< project words >",
        find_command=rg,
        cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1],
    })
end

function M.search_git_files()
    require("telescope.builtin").git_files({
        hidden = true,
        prompt_prefix = "   ",
        prompt_title = "< project files >",
        find_command=rg,
    })
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
        },
    }:find()
end

return M
