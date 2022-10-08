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
        find_command = "rg",
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
        find_command = "rg",
        cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1],
    })
end

function M.search_git_files()
    require("telescope.builtin").git_files({
        hidden = true,
        prompt_prefix = "   ",
        prompt_title = "< project files >",
        find_command = "rg",
    })
end

function M.buffers()
    require("telescope.builtin").buffers()
end

function M.help_tags()
    require("telescope.builtin").help_tags()
end

function M.lsp_document_symbols()
    require("telescope.builtin").lsp_document_symbols()
end

function M.lsp_workspace_symbols()
    require("telescope.builtin").lsp_workspace_symbols()
end

function M.git_status()
    require("telescope.builtin").git_status()
end

function M.lsp_references()
    require("telescope.builtin").lsp_references()
end

function M.show_custom_functions()
    require("aaron.telescope.custom").show_custom_functions()
end

function M.show_nipro_commands()
    require("aaron.telescope.custom").show_nipro_commands()
end

return M
