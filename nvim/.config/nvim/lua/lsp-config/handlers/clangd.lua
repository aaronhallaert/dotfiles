local M = {}

M.setup = function(nvim_lsp)
    local cmd = {
        "/usr/bin/clangd",
        "--clang-tidy=false", -- sonarlint only required in CI
        "--query-driver="
            .. vim.fn.expand(
                "$HOME/Developer/televic/build_scripts/toolchains/televic_pc_sdk_2023.02.7/bin/i686-linux-g++"
            ),
    }

    nvim_lsp.clangd.setup({
        root_dir = nvim_lsp.util.root_pattern(
            "CMakeLists.txt"
            -- "compile_commands.json"
        ),
        single_file_support = true,
        capabilities = {
            textDocument = {
                completion = {
                    editsNearCursor = true,
                },
            },
            offsetEncoding = { "utf-16" },
        },
        on_new_config = function(new_config)
            local status, cmake = pcall(require, "cmake-tools")
            if status then
                cmake.clangd_on_new_config(new_config)
            end
        end,
        cmd = cmd,
    })
end

return M
