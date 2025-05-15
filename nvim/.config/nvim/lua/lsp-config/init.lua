local nvim_lsp = require("lspconfig")

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
    "groovyls",
    "azure_pipelines_ls",
    -- "tailwindcss",
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        capabilities = capabilities_with_completion,
        root_dir = nvim_lsp.util.root_pattern(".git"),
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
require("lsp-config.handlers.rust_analyzer").setup(
    nvim_lsp,
    capabilities_with_completion
)
require("lsp-config.handlers.clangd").setup(nvim_lsp)
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

nvim_lsp.jsonls.setup({
    capabilities = capabilities_with_completion,
    init_options = { provideFormatter = false },
    filetypes = { "json" },
    root_dir = nvim_lsp.util.root_pattern(".git"),
})

nvim_lsp.bitbake_language_server.setup({
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
})

nvim_lsp.lua_ls.setup({
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

nvim_lsp.volar.setup({
    cmd = { "vue-language-server", "--stdio" },
    capabilities = capabilities_with_completion,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    filetypes = { "vue" },
})

nvim_lsp.solargraph.setup({
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

nvim_lsp.ts_ls.setup({
    capabilities = capabilities_with_completion,
    root_dir = nvim_lsp.util.root_pattern(
        "pnpm-lock.yaml",
        "yarn.lock",
        "package.json"
    ),
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
})

nvim_lsp.stylelint_lsp.setup({
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

nvim_lsp.pylsp.setup({
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
})
