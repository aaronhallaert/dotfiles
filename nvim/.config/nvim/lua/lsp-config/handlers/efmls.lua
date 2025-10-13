local markdownlint = require("plugins.config.efm.markdownlint")
local stylua = require("efmls-configs.formatters.stylua")
local prettier = require("efmls-configs.formatters.prettier")
local black = require("efmls-configs.formatters.black")
-- local jq = require("plugins.config.efm.jq")
-- local luacheck = require("efmls-configs.linters.luacheck")
-- local eslint = require("efmls-configs.linters.eslint")
--
local languages = {
    python = { black },
    json = { prettier },
    markdown = { markdownlint, prettier },
    javascript = { prettier },
    javascriptreact = { prettier },
    typescriptreact = { prettier },
    typescript = { prettier },
    vue = { prettier },
    lua = { stylua },
}

local efmls_config = {
    filetypes = vim.tbl_keys(languages),
    settings = {
        rootMarkers = { ".git/" },
        languages = languages,
    },
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
    },
}

vim.lsp.config(
    "efm",
    vim.tbl_extend("force", efmls_config, {
        rootMarkers = { ".git/" },
        cmd = { "efm-langserver" },
    })
)
