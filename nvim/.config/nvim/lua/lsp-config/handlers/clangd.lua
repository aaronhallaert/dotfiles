local M = {}
vim.lsp.enable("clangd", false)

M.setup = function()
    local cmd = {
        "clangd",
        "--query-driver="
            .. vim.fn.expand("$HOME")
            .. "/.local/share/build_scripts/toolchains/**/*g++",
        "--clang-tidy=false",
    }

    vim.lsp.config.clangd = {
        root_markers = {"CMakeLists.txt"},
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
        arg = {},
    }
end

return M
