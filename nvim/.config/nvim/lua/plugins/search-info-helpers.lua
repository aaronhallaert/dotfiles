return {
    {
        "voldikss/vim-translator",
        config = function()
            vim.g.translator_target_lang = "en"
            -- Echo translation in the cmdline
            vim.api.nvim_set_keymap(
                "n",
                "<leader>t",
                ":Translate<CR>",
                { noremap = true, silent = true }
            )
            vim.api.nvim_set_keymap(
                "v",
                "<leader>t",
                ":TranslateV<CR>",
                { noremap = true, silent = true }
            )

            -- Display translation in a window
            vim.api.nvim_set_keymap(
                "n",
                "<leader>w",
                ":TranslateW<CR>",
                { noremap = true, silent = true }
            )
            vim.api.nvim_set_keymap(
                "v",
                "<leader>w",
                ":TranslateWV<CR>",
                { noremap = true, silent = true }
            )
            -- Replace the text with translation
            vim.api.nvim_set_keymap(
                "n",
                "<leader>r",
                ":TranslateR<CR>",
                { noremap = true, silent = true }
            )
            vim.api.nvim_set_keymap(
                "v",
                "<leader>r",
                ":TranslateRV<CR>",
                { noremap = true, silent = true }
            )
            -- Translate the text in clipboard
            vim.api.nvim_set_keymap(
                "n",
                "<leader>x",
                ":TranslateX<CR>",
                { noremap = true, silent = true }
            )
        end,
        event = "VeryLazy",
    },
    {
        "ron89/thesaurus_query.vim",
        config = function()
            vim.g.tq_map_keys = 0
            vim.api.nvim_set_keymap(
                "n",
                "<leader>ss",
                ":ThesaurusQueryLookupCurrentWord<CR>",
                { noremap = true }
            )
        end,
        event = "VeryLazy",
    },
    {
        "rhysd/vim-grammarous",
        event = "VeryLazy",
    },
    -- "inkarkat/vim-ingo-library",
    -- "inkarkat/vim-SpellCheck",
    -- "RishabhRD/popfix",
    {
        "RishabhRD/nvim-cheat.sh",
        event = "VeryLazy",
    },
    {
        "dbeniamine/cheat.sh-vim",
        event = "VeryLazy",
    },
}
