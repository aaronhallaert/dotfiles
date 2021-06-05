local actions = require('telescope.actions')
require('telescope').setup{
   defaults = {
       --prompt_prefix = "> ",
   },
   mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
      n = {
        ['<esc>'] = actions.close,
      }
    },
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


function M.search_git_files()
    require("telescope.builtin").git_files({
        hidden = true,
        prompt_prefix = "   ",
        find_command=rg,
        hidden = true,
    })
end


return M
