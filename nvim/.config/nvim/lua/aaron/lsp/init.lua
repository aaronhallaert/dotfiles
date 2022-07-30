local nvim_lsp = require("lspconfig")

require("aaron.lsp.ui")

vim.api.nvim_create_autocmd("BufWritePre", {
    command = "lua vim.lsp.buf.formatting_sync(nil, 1000)",
    pattern = {
        "*.js",
        "*.jsx",
        "*.tsx",
        "*.ts",
        "*.py",
        "*.rb",
        "*.lua",
        "*.json",
        "*.md",
        "*.css"
    }
})

local on_attach = function(client, bufnr)
    require("aaron.lsp.signature")
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                prefix = "⦿",
                spacing = 4,
                border = 'single'
            },
            signs = true,
            update_in_insert = false
        })

    require("aaron.lsp.keymaps").setup {
        bufnr = bufnr
    }

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {
    "pylsp",
    "jsonls",
    "vimls",
    "tsserver",
    "diagnosticls",
    "sumneko_lua",
    "sourcekit",
    "solargraph",
    "rust_analyzer",
    "gopls", -- "tailwindcss",
    "stylelint_lsp"
}

-- require('nlua.lsp.nvim').setup(nvim_lsp, {
--    on_attach = on_attach,
-- })

local capabilities_with_completion =
    require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol
                                                    .make_client_capabilities())

local prettierFormatSettings = {
    rootMarkers = {
        ".eslintrc.js",
        "package.json"
    }
    -- formatCommand = "prettier --stdin-filepath %"
}
-- General purpose language server
require("lspconfig").efm.setup({

    on_attach = on_attach,
    -- lspconfig, disable lsp global options
    init_options = {
        documentFormatting = true
    },
    cmd = {
        'efm-langserver',
        '-logfile',
        '/tmp/efm.log',
        '-loglevel',
        '5'
    },
    filetypes = {
        "json",
        "markdown",
        "lua",
        "typescriptreact",
        "typescript",
        "javascriptreact",
        "javascript"
    },
    -- lsp specific options
    settings = {
        rootMarkers = {
            ".git"
        },
        languages = {
            json = {
                {
                    formatCommand = "jq .",
                    formatStdin = true
                }
            },
            markdown = {
                {
                    rootMarkers = {
                        ".markdownlint.json"
                    },
                    lintCommand = "markdownlint -c ./.markdownlint.json -s",
                    lintStdin = true,
                    lintFormats = {
                        "%f:%l:%c %m",
                        "%f:%l %m",
                        "%f: %l: %m"
                    }
                    -- formatCommand = "prettier --stdin-filepath %"
                }
            },
            lua = {
                {
                    rootMarkers = {
                        ".luaconfig.yaml"
                    },
                    formatCommand = "lua-format -c ./luaconfig.yaml",
                    formatStdin = true
                }
            },
            typescriptreact = {
                prettierFormatSettings
            },
            typescript = {
                prettierFormatSettings
            },
            javascript = {
                prettierFormatSettings
            },
            javascriptreact = {
                prettierFormatSettings
            }
        }
    }
})

for _, lsp in ipairs(servers) do
    if lsp == "solargraph" then
        nvim_lsp.solargraph.setup({
            on_attach = on_attach,
            capabilities = capabilities_with_completion,
            -- cmd = {"nc", "localhost", "7658"},
            cmd = {
                "solargraph",
                "stdio"
            },
            filetypes = {
                "ruby",
                "rakefile"
            },
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
    elseif lsp == "rust_analyzer" then
        nvim_lsp.rust_analyzer.setup({
            capabilities = capabilities_with_completion,
            on_attach = on_attach,
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy"
                    }
                }
            }
        })
    elseif lsp == "sumneko_lua" then
        nvim_lsp.sumneko_lua.setup({
            on_attach = on_attach,
            capabilities = capabilities_with_completion,
            init_options = {
                documentFormatting = false
            },
            cmd = {
                "lua-language-server",
                "--stdio"
            },
            filetypes = {
                "lua"
            },
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim"
                        }
                    }
                }
            }
        })
    elseif lsp == "tsserver" then
        -- disable formatting for typescript
        nvim_lsp.tsserver.setup({
            init_options = {
                documentFormatting = false
            },
            capabilities = capabilities_with_completion,
            root_dir = nvim_lsp.util.root_pattern("package.json"),
            on_attach = function(client, bufnr)
                client.resolved_capabilities.document_formatting = false
                on_attach(client, bufnr)
            end
        })
    elseif lsp == "stylelint_lsp" then
        nvim_lsp.stylelint_lsp.setup({
            on_attach = on_attach,
            root_dir = nvim_lsp.util.root_pattern("package.json"),
            filetypes = {
                "css"
            },
            settings = {
                stylelintplus = {
                    enable = true,
                    autoFixOnFormat = true,
                    configFile = ".stylelintrc.json"
                }
            }
        })
    else
        nvim_lsp[lsp].setup({
            capabilities = capabilities_with_completion,
            on_attach = on_attach,
            root_dir = nvim_lsp.util.root_pattern(".git")
        })
    end
end
