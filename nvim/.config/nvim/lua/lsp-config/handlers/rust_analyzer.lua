local M = {}

M.setup = function(capabilities)
    local rust_analyzer_config = {
        checkOnSave = true,
        check = {
            command = "clippy",
            extraArgs = {
                -- "--",
                -- "-Dwarnings",
                -- "-Wclippy::expect_used",
                -- "-Wclippy::unwrap_used",
                -- "-Wclippy::pedantic",
                -- "-Wclippy::nursery",
            },
        },
    }

    if
        string.find(
            vim.fn.getcwd(),
            "/workspaces/confero%-digital%-audio%-distribution"
        )
    then
        rust_analyzer_config = {
            runnables = {
                command = "~/workspaces/confero-digital-audio-distribution/gst-cargo",
            },
            cargo = {
                extraEnv = {
                    PKG_CONFIG_PATH = "$PKG_CONFIG_PATH:/target/gstreamer-build/meson-uninstalled",
                    LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:/target/gstreamer-build",
                },
            },
            checkOnSave = {
                command = "clippy",
            },
        }
    end

    if string.find(vim.fn.getcwd(), "/workspaces/confero%-cam%-compositor") then
        vim.print("Setting up rust-analyzer for confero-cam-compositor")
        rust_analyzer_config = {
            runnables = {
                command = "~/workspaces/confero-cam-compositor/gst-cargo",
            },
            cargo = {
                extraEnv = {
                    PKG_CONFIG_PATH = "$PKG_CONFIG_PATH:/target/gstreamer-build/meson-uninstalled",
                    LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:/target/gstreamer-build",
                },
            },
            checkOnSave = {
                command = "clippy",
            },
        }
    end

    vim.lsp.config.rust_analyzer = {
        capabilities = capabilities,
        -- on_attach = function(client, bufnr)
        -- vim.lsp.inlay_hint.enable(bufnr, true)
        -- client.server_capabilities.documentFormattingProvider = false
        -- end,
        settings = {
            ["rust-analyzer"] = rust_analyzer_config,
        },
    }
end
return M
