return {
    lintCommand = "luacheck % --codes --no-color --quiet",
    lintFormats = { '%.%#:%l:%c: (%t%n) %m' },
    lintStdin = true,
}
