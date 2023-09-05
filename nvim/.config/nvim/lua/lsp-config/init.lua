local nvim_lsp = require("lspconfig")
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

require("neodev").setup()
require("lsp-config.ui").init()
require("lsp-config.handlers")

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        require("aaron.utils").lsp_format()
    end,
    pattern = {
        "*.js",
        "*.jsx",
        "*.tsx",
        "*.ts",
        "*.py",
        "*.rb",
        "*.rs",
        "*.lua",
        "*.json",
        -- "*.md",
        "*.css",
    },
})

vim.api.nvim_create_autocmd("BufWritePost", {
    command = "silent! !eslint_d % --fix",
    pattern = { "*.js", "*.jsx", "*.tsx", "*.ts" },
})

local on_attach = function(client, bufnr)
    require("lsp-config.signature")
    require("lsp-config.keymaps").setup({ bufnr = bufnr })
    require("lsp-config.ui").lspHighlights({ client = client })
end

local capabilities_with_completion =
    require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    )

local efmls = require("efmls-configs")
efmls.init({
    -- Your custom attach function
    on_attach = on_attach,

    -- Enable formatting provided by efm langserver
    init_options = {
        documentFormatting = true,
    },
})

local markdownlint = require("plugins.config.efm.markdownlint")
-- local jq = require("plugins.config.efm.jq")
local stylua = require("efmls-configs.formatters.stylua")
-- local luacheck = require("efmls-configs.linters.luacheck")
local prettier = require("efmls-configs.formatters.prettier")
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

nvim_lsp.volar.setup({
    on_attach = on_attach,
    cmd = { "vue-language-server", "--stdio" },
    capabilities = capabilities_with_completion,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    filetypes = { "vue" },
})

nvim_lsp.solargraph.setup({
    on_attach = on_attach,
    capabilities = capabilities_with_completion,
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby", "rakefile" },
    root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git"),
    settings = {
        solargraph = {
            formatting = true,
            completion = true,
            diagnostics = true,
            folding = true,
            references = true,
            rename = true,
            symbols = true,
        },
    },
})

if not configs.ruby_lsp then
    local enabled_features = {
        "documentHighlights",
        "documentSymbols",
        "foldingRanges",
        "selectionRanges",
        -- "semanticHighlighting",
        "formatting",
        "codeActions",
    }

    configs.ruby_lsp = {
        default_config = {
            cmd = { "ruby-lsp" },
            filetypes = { "ruby" },
            root_dir = util.root_pattern("Gemfile", ".git"),
            init_options = { enabledFeatures = enabled_features },
            settings = {},
        },
        commands = {
            FormatRuby = {
                function()
                    vim.lsp.buf.format({ name = "ruby_lsp", async = true })
                end,
                description = "Format using ruby-lsp",
            },
        },
    }
end

nvim_lsp.rust_analyzer.setup({
    capabilities = capabilities_with_completion,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
                -- extraArgs = {
                --     "--",
                -- "-W",
                -- "clippy::unwrap_used",
                -- "-W",
                -- "clippy::expect_used",
                -- "-W",
                -- "clippy::pedantic",
                -- "-W",
                -- "clippy::nursery",
                -- },
            },
        },
    },
})

nvim_lsp.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities_with_completion,
    init_options = { documentFormatting = false },
    cmd = { "lua-language-server", "--stdio" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            format = { enable = false },
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
        },
    },
})

-- nvim_lsp.sqlls.setup({ root_dir = nvim_lsp.util.root_pattern(".git") })

nvim_lsp.tsserver.setup({
    capabilities = capabilities_with_completion,
    root_dir = nvim_lsp.util.root_pattern("pnpm-lock.yaml", "yarn.lock"),
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        on_attach(client, bufnr)
    end,
})
nvim_lsp.stylelint_lsp.setup({
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    filetypes = { "css" },
    settings = {
        stylelintplus = {
            enable = true,
            autoFixOnFormat = true,
            configFile = ".stylelintrc.json",
        },
    },
})

nvim_lsp.ccls.setup({
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern(".git"),
    filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
    },
    --     command = "ccls",
    --     filetypes = {
    --         "c",
    --         "cpp",
    --         "objc",
    --         "objcpp",
    --     },
    --     rootPatterns = {
    --         ".ccls",
    --         "compile_commands.json",
    --         ".vim/",
    --         ".git/",
    --         ".hg/",
    --     },
    init_options = {
        clang = {
            extraArgs = { "-std=c++20" },
        },
    },
})

-- Default servers
local servers = {
    "pylsp",
    "jsonls",
    "vimls",
    -- "sourcekit",
    "gopls",
    "tailwindcss",
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        capabilities = capabilities_with_completion,
        on_attach = on_attach,
        root_dir = nvim_lsp.util.root_pattern(".git"),
    })
end
