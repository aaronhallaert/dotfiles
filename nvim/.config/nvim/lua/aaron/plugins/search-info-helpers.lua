local M = {}

M.setup = function(config)
    local use = config.use
    use("voldikss/vim-translator")
    use("ron89/thesaurus_query.vim")
    use("rhysd/vim-grammarous")
    use("inkarkat/vim-ingo-library")
    use("inkarkat/vim-SpellCheck")
    use("RishabhRD/popfix")
    use("RishabhRD/nvim-cheat.sh")
    use("dbeniamine/cheat.sh-vim")
end

return M
