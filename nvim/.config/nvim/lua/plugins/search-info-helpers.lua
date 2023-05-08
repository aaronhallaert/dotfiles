return {
    {
        "voldikss/vim-translator",
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
