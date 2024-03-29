local M = {}
function M.search_dotfiles()
    require("telescope.builtin").find_files({
        hidden = true,
        prompt_prefix = " ⚙  ",
        prompt_title = "< dotfiles >",
        cwd = "$HOME/dotfiles",
    })
end

function M.search_dotfiles_words()
    require("telescope.builtin").live_grep({
        find_command = "rg",
        prompt_prefix = " ⚙  ",
        prompt_title = "< dotfiles words >",
        cwd = "$HOME/dotfiles",
        attach_mappings = function(_, map)
            map("i", "<c-g>", require("telescope.actions").to_fuzzy_refine)
            return true
        end,
    })
end

local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local pickers = require("telescope.pickers")
local make_entry = require("telescope.make_entry")
local flatten = vim.tbl_flatten
local live_grepper
function M.find_all_patterns()
    live_grepper = finders.new_job(function(prompt)
        local find_command = "git ls-files"
        if not prompt or prompt == "" then
            return nil
        end

        for word in prompt:gmatch("%w+") do
            find_command = find_command .. " | xargs rg -i -l " .. word
        end

        local args = {}
        for arg in find_command:gmatch("%S+") do
            table.insert(args, arg)
        end

        return flatten({ "bash", "-c", find_command })
    end, make_entry.gen_from_string())

    pickers
        .new({
            prompt_title = "Files containing all words",
            finder = live_grepper,
            previewer = previewers.vim_buffer_cat.new({ title = "File" }),
        })
        :find()
end

function M.search_gitwords()
    require("telescope.builtin").live_grep({
        find_command = "rg --vimgrep",
        prompt_prefix = "   ",
        prompt_title = "Live Grep",
        cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1],
        attach_mappings = function(_, map)
            map("i", "<c-g>", require("telescope.actions").to_fuzzy_refine)
            return true
        end,
    })
end

function M.search_string_under_cursor()
    require("telescope.builtin").grep_string({
        find_command = "rg",
        prompt_prefix = "   ",
        prompt_title = "< word under cursor >",
    })
end

function M.search_gitwords_not_hidden()
    require("telescope.builtin").live_grep({
        vimgrep_arguments = {
            "rg",
            "--no-heading",
            "--line-number",
            "--column",
            "--smart-case",
        },
        find_command = "rg",
        prompt_prefix = "   ",
        prompt_title = "< project words without hidden files >",
        cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1],
        attach_mappings = function(_, map)
            map("i", "<c-g>", require("telescope.actions").to_fuzzy_refine)
            return true
        end,
    })
end

function M.find_registers()
    require("telescope.builtin").registers()
end

function M.search_project_files()
    require("telescope.builtin").find_files({
        prompt_prefix = "   ",
        hidden = true,
        prompt_title = "< project files >",
    })
    -- Fallback on git_files
    -- require("telescope.builtin").git_files({
    --     find_command = "rg",
    --     hidden = true,
    --     prompt_prefix = "   ",
    --     prompt_title = "< project files >",
    -- })
end

function M.search_recent_files()
    require("telescope.builtin").oldfiles({ only_cwd = true })
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

return M
