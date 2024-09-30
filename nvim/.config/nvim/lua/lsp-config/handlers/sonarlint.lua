-- sonarlint.nvim only works with Sonarlint VSCode 4.7.0
local sonarlint_url =
    "https://github.com/SonarSource/sonarlint-vscode/releases/download/4.7.0%2B76532/sonarlint-vscode-4.7.0.vsix"
local app_location = vim.fn.stdpath("data")

local download = function()
    -- if unzip is not installed return early
    if vim.fn.executable("unzip") == 0 then
        vim.api.nvim_err_writeln("Please install unzip")
        return 1
    end

    if vim.fn.executable("curl") == 0 then
        vim.api.nvim_err_writeln("Please install curl")
        return 1
    end

    if
        vim.fn.filereadable(
            app_location .. "/sonarlint/extension/server/sonarlint-ls.jar"
        ) == 0
    then
        -- make sonarlint directory in app_location
        vim.print("Downloading Sonarlint VSCode 4.7.0 ...")
        vim.fn.mkdir(app_location .. "/sonarlint", "p")
        -- curl into the app_location
        vim.fn.system(
            "curl -L "
                .. sonarlint_url
                .. " --output "
                .. app_location
                .. "/sonarlint/sonarlint-ls.vsix"
        )
        vim.print("Unzipping Sonarlint VSCode 4.7.0 ...")
        vim.fn.system(
            "unzip "
                .. app_location
                .. "/sonarlint/sonarlint-ls.vsix -d "
                .. app_location
                .. "/sonarlint"
        )
        vim.print("Successfully installed Sonarlint VSCode 4.7.0")
    end

    return 0
end
local M = {}

M.setup = function()
    local err = download()
    if err ~= 0 then
        vim.print("Failed to download Sonarlint VSCode 4.7.0")
        return
    end

    local sonarlint_loc = app_location .. "/sonarlint/"

    require("sonarlint").setup({
        server = {
            cmd = {
                "java",
                "-jar",
                sonarlint_loc .. "extension/server/sonarlint-ls.jar",
                -- Ensure that sonarlint-language-server uses stdio channel
                "-stdio",
                "-analyzers",
                sonarlint_loc .. "extension/analyzers/sonarcfamily.jar",
            },
            settings = {
                -- The default for sonarlint is {}, this is just an example
                sonarlint = {
                    pathToCompileCommands = "compile_commands.json",
                    -- pathToCompileCommands = require("televic").plixus_apps_build_dir
                    -- .. "/compile_commands.json",
                },
            },
            autostart = true,
        },
        filetypes = {
            -- Tested and working
            "cpp",
            -- 'hpp',
        },
    })
end
return M
