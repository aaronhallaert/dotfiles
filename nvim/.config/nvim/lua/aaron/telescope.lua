local actions = require('telescope.actions')
require('telescope').setup{
   defaults = {
       --prompt_prefix = "> ",
   },
   pickers = {
       mappings = {
          i = {
            ['<esc>'] = actions.close,
          },
          n = {
            ['<esc>'] = actions.close,
          }
       },
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

return M
