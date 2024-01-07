local efmls = require("efmls-configs")

efmls.init({
    -- Enable formatting provided by efm langserver
    init_options = {
        documentFormatting = true,
    },
})
--
local markdownlint = require("plugins.config.efm.markdownlint")
local stylua = require("efmls-configs.formatters.stylua")
local prettier = require("efmls-configs.formatters.prettier")
-- local jq = require("plugins.config.efm.jq")
-- local luacheck = require("efmls-configs.linters.luacheck")
-- local eslint = require("efmls-configs.linters.eslint")

efmls.setup({
    json = { formatter = prettier },
    markdown = { linter = markdownlint, formatter = prettier },
    javascript = { formatter = prettier },
    javascriptreact = { formatter = prettier },
    typescriptreact = { formatter = prettier },
    typescript = { formatter = prettier },
    vue = { formatter = prettier },
    lua = { formatter = stylua },
})
