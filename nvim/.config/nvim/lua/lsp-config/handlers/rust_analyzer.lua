local M = {}

M.setup = function(nvim_lsp, capabilities)
    local rust_analyzer_config = {
        checkOnSave = {
            command = "clippy",
            extraArgs = {
                "--",
                "-D",
                "warnings",
                "-W",
                "clippy::unwrap_used",
                "-W",
                "clippy::expect_used",
                "-W",
                "clippy::pedantic",
                "-W",
                "clippy::nursery",
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

    nvim_lsp.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = rust_analyzer_config,
        },
    })
end
return M
