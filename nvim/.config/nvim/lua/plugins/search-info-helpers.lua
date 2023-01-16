return {
    "voldikss/vim-translator",
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
    },
    "rhysd/vim-grammarous",
    "inkarkat/vim-ingo-library",
    -- "inkarkat/vim-SpellCheck",
    "RishabhRD/popfix",
    "RishabhRD/nvim-cheat.sh",
    "dbeniamine/cheat.sh-vim",
}
