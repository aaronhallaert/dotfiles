local nvim_lsp = require("lspconfig")

require("aaron.lsp.ui").init()
require("aaron.lsp.handlers")

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function() vim.lsp.buf.format() end,
    pattern = {
        "*.js", "*.jsx", "*.tsx", "*.ts", "*.py", "*.rb", "*.lua", "*.json",
        "*.md", "*.css"
    }
})

vim.api.nvim_create_autocmd("BufWritePost", {
    command = "silent! !eslint_d % --fix",
    pattern = {"*.js", "*.jsx", "*.tsx", "*.ts"}
})

local on_attach = function(client, bufnr)
    require("aaron.lsp.signature")
    require("aaron.lsp.keymaps").setup {bufnr = bufnr}
    require("aaron.lsp.ui").lspHighlights {client = client}
end

local capabilities_with_completion =
    require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol
                                                    .make_client_capabilities())

local prettier = require("aaron.efm.prettier")
local luaFormat = require("aaron.efm.lua-format")
local markdownlint = require("aaron.efm.markdownlint")
local jq = require("aaron.efm.jq")
local eslint = require("aaron.efm.eslint")

-- General purpose language server
nvim_lsp.efm.setup({
    on_attach = on_attach,
    -- lspconfig, disable lsp global options
    init_options = {documentFormatting = true},
    cmd = {'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '5'},
    filetypes = {
        "json", "markdown", "lua", "typescriptreact", "typescript",
        "javascriptreact", "javascript"
    },
    -- lsp specific options
    settings = {
        rootMarkers = {".git/"},
        lintDebounce = 100,
        languages = {
            json = {jq},
            markdown = {markdownlint, prettier},
            lua = {luaFormat},
            typescriptreact = {prettier, eslint},
            typescript = {prettier, eslint},
            javascript = {prettier, eslint},
            javascriptreact = {prettier, eslint}
        }
    }
})
nvim_lsp.solargraph.setup({
    on_attach = on_attach,
    capabilities = capabilities_with_completion,
    -- cmd = {"nc", "localhost", "7658"},
    cmd = {"solargraph", "stdio"},
    filetypes = {"ruby", "rakefile"},
    root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git"),
    settings = {
        solargraph = {
            formatting = true,
            completion = true,
            diagnostics = true,
            folding = true,
            references = true,
            rename = true,
            symbols = true
        }
    }
})
nvim_lsp.rust_analyzer.setup({
    capabilities = capabilities_with_completion,
    on_attach = on_attach,
    settings = {["rust-analyzer"] = {checkOnSave = {command = "clippy"}}}
})
nvim_lsp.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities_with_completion,
    init_options = {documentFormatting = false},
    cmd = {"lua-language-server", "--stdio"},
    filetypes = {"lua"},
    settings = {Lua = {diagnostics = {globals = {"vim"}}}}
})
nvim_lsp.tsserver.setup({
    init_options = {documentFormatting = false},
    capabilities = capabilities_with_completion,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end
})
nvim_lsp.stylelint_lsp.setup({
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    filetypes = {"css"},
    settings = {
        stylelintplus = {
            enable = true,
            autoFixOnFormat = true,
            configFile = ".stylelintrc.json"
        }
    }
})

-- Default servers
local servers = {
    "pylsp", "jsonls", "vimls", "sourcekit", "gopls", "tailwindcss"
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        capabilities = capabilities_with_completion,
        on_attach = on_attach,
        root_dir = nvim_lsp.util.root_pattern(".git")
    })
end
