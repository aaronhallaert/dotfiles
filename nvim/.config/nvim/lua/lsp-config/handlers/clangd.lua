local M = {}

M.setup = function(nvim_lsp)
    local cmd = {
        "/usr/bin/clangd",
        "--clang-tidy",
    }
    if
        string.find(
            vim.fn.getcwd(),
            "/home/aaron/Developer/televic/build%_scripts/repositories/plixus%_apps"
        )
    then
        cmd = {
            "/usr/bin/clangd",
            "--query-driver=/home/aaron/developer/televic/build_scripts/toolchains/televic_pc_sdk_2023.02.1/bin/i686-linux*",
            "--clang-tidy",
        }
    end

    nvim_lsp.clangd.setup({
        root_dir = nvim_lsp.util.root_pattern("CMakeLists.txt"),
        capabilities = {
            textDocument = {
                completion = {
                    editsNearCursor = true,
                },
            },
            offsetEncoding = { "utf-16" },
        },
        on_new_config = function(new_config, new_cwd)
            local status, cmake = pcall(require, "cmake-tools")
            if status then
                cmake.clangd_on_new_config(new_config)
            end
        end,
        cmd = cmd,
    })
end

return M
