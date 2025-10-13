-- local nvim_lsp = require("lspconfig")

require("lsp-config.auto")
require("lsp-config.ui")
require("lsp-config.handlers")

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "efm",
    },
})

local capabilities_with_completion =
    require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    )

---------------------
-- Default handlers --
---------------------
local servers = {
    -- "jsonls",
    "angularls",
    "bashls",
    "vimls",
    "gopls",
    "svelte",
    "marksman",
    "groovyls",
    "azure_pipelines_ls",
    -- "tailwindcss",
}
for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        capabilities = capabilities_with_completion,
        root_markers = { ".git" },
    })
end

-----------------------
-- Complex handlers  --
-- * efmls           --
-- * rust            --
-- * clangd          --
-- * sonarlint       --
-----------------------
require("lsp-config.handlers.efmls")
require("lsp-config.handlers.rust_analyzer").setup(capabilities_with_completion)
require("lsp-config.handlers.clangd").setup()
require("lsp-config.handlers.sonarlint").setup()

---------------------
-- Basic handlers  --
-- * lua_ls        --
-- * volar         --
-- * solargraph    --
-- * tsserver      --
-- * stylelint_lsp --
-- * pylsp         --
---------------------

vim.lsp.config.jsonls = {
    capabilities = capabilities_with_completion,
    init_options = { provideFormatter = false },
    filetypes = { "json" },
    root_markers = { ".git" },
}

vim.lsp.config.bitbake_language_server = {
    capabilities = capabilities_with_completion,
    cmd = { "language-server-bitbake", "--stdio" },
    filetypes = { "bitbake" },
    settings = {
        bitbake = {
            pathToBuildFolder = "${workspaceFolder}/build",
            pathToEnvScript = "${workspaceFolder}/openembedded-core/oe-init-build-env",
            pathToBitbakeFolder = "${workspaceFolder}/bitbake",
        },
    },
}

vim.lsp.config.lua_ls = {
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
}

vim.lsp.config.volar = {
    cmd = { "vue-language-server", "--stdio" },
    capabilities = capabilities_with_completion,
    root_markers = { "package.json" },
    filetypes = { "vue" },
}

vim.lsp.config.solargraph = {
    capabilities = capabilities_with_completion,
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby", "rakefile" },
    root_markers = { "Gemfile", ".git" },
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
}

vim.lsp.config.ts_ls = {
    capabilities = capabilities_with_completion,
    root_markers = { "pnpm-lock.yaml", "yarn.lock", "package.json" },
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
}

vim.lsp.config.stylelint_lsp = {
    root_markers = { "package.json" },
    filetypes = { "css" },
    settings = {
        stylelintplus = {
            enable = true,
            autoFixOnFormat = true,
            configFile = ".stylelintrc.json",
        },
    },
}

vim.lsp.config.pylsp = {
    on_attach = function(client)
        -- capabilities_with_completion(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 120,
                },
            },
        },
    },
}
