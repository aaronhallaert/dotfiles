local M = {}

M.setup = function(nvim_lsp)
    nvim_lsp.clangd.setup({
        root_dir = nvim_lsp.util.root_pattern(".git"),
        capabilities = {
            textDocument = {
                completion = {
                    editsNearCursor = true,
                },
            },
            offsetEncoding = { "utf-16" },
        },
        cmd = {
            "/usr/bin/clangd",
            "--compile-commands-dir=./build",
            "--query-driver=/home/aaron/Developer/televic/build_scripts/toolchains/televic_pc_sdk_2023.02.1/bin/i686-linux*",
            "--clang-tidy",
        },
    })
end

return M
