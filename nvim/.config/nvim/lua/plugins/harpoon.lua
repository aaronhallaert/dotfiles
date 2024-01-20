local M = {
    {
        "aaronhallaert/harpoon",
        branch = "fix/nil_check",
        event = "VeryLazy",
        config = function()
            local harpoon = require("harpoon")

            harpoon.setup({})

            -- Marks
            vim.api.nvim_set_keymap(
                "n",
                "<C-h>",
                ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<leader>ah",
                ':lua require("harpoon.mark").add_file()<CR>',
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<leader>th",
                ':lua require("harpoon.mark").toggle_file()<CR>',
                { noremap = true }
            )

            function _G.RunCommandInTerminal(
                command, --[[optional]]
                term
            )
                if not term then
                    term = 1
                end

                require("harpoon.term").sendCommand(term, command, nil)
                require("harpoon.term").gotoTerminal(term)
            end

            function _G.Get_ruby_test_command(--[[optional]]line)
                local test_file = vim.fn.getreg("%")
                local test_line = vim.api.nvim_win_get_cursor(0)[1]
                local test_position = test_file .. ":" .. test_line

                if not line then
                    line = false
                end

                if line then
                    return "bundle exec rspec " .. test_position
                else
                    return "bundle exec rspec " .. test_file
                end
            end

            if
                string.find(
                    vim.fn.getcwd(),
                    "/workspaces/confero%-digital%-audio%-distribution"
                )
            then
                vim.api.nvim_set_keymap(
                    "n",
                    "stl",
                    ':lua RunCommandInTerminal("./gst-cargo nextest run --no-capture -- " .. vim.fn.expand("<cword>"))<CR>',
                    { noremap = true, silent = true }
                )
            else
                vim.api.nvim_set_keymap(
                    "n",
                    "stl",
                    ':lua RunCommandInTerminal("cargo nextest run --no-capture -- " .. vim.fn.expand("<cword>"))<CR>',
                    { noremap = true, silent = true }
                )
            end

            -- NAVIGATION
            vim.api.nvim_set_keymap(
                "n",
                "gt",
                ':lua require("harpoon.term").gotoTerminal(1)<CR>',
                { noremap = true }
            )

            vim.api.nvim_set_keymap(
                "n",
                "gj",
                ':lua require("harpoon.ui").nav_file(1)<CR>',
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "gk",
                ':lua require("harpoon.ui").nav_file(2)<CR>',
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "gl",
                ':lua require("harpoon.ui").nav_file(3)<CR>',
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "g;",
                ':lua require("harpoon.ui").nav_file(4)<CR>',
                { noremap = true }
            )

            vim.api.nvim_set_keymap(
                "n",
                "gn",
                ':lua require("harpoon.ui").nav_next()<CR>',
                { noremap = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "gp",
                ':lua require("harpoon.ui").nav_prev()<CR>',
                { noremap = true }
            )
        end,
    },
}

return M
