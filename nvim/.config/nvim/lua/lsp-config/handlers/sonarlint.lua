require("sonarlint").setup({
    server = {
        cmd = {
            "sonarlint-language-server",
            -- Ensure that sonarlint-language-server uses stdio channel
            "-stdio",
            "-analyzers",
            "/home/aaron/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarcfamily.jar",
        },
        settings = {
            -- The default for sonarlint is {}, this is just an example
            sonarlint = {
                pathToCompileCommands = "compile_commands.json",
            },
        },
        autostart = true,
    },
    filetypes = {
        -- Tested and working
        "cpp",
        -- "hpp",
    },
})
