local M = {}
vim.lsp.enable("clangd", false)

M.setup = function(nvim_lsp)
    local cmd = {
        "clangd",
        -- "--query-driver="
        --     .. vim.fn.expand("$HOME")
        --     .. "/Developer/televic/build_scripts/toolchains/televic_pc_sdk_2023.02.9/bin/i686-linux-g++",
        -- "--query-driver="
        --     .. vim.fn.expand("$HOME")
        --     .. "/Developer/televic/build_scripts_6/toolchains/mmu-glibc-x86_64-cortexa9hf-neon-toolchain-6.6.x/sysroots/x86_64-tcssdk-linux/usr/bin/arm-tcs-linux-gnueabi/arm-tcs-linux-gnueabi-g++",
        -- "--query-driver="
        --     .. vim.fn.expand("$HOME")
        --     .. "/.local/share/build_scripts/**/*g++",
        "--query-driver="
            .. vim.fn.expand("$HOME")
            .. "/**/*g++",

        "--clang-tidy=false",
    }

    nvim_lsp.clangd.setup({
        root_dir = nvim_lsp.util.root_pattern("CMakeLists.txt"),
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
