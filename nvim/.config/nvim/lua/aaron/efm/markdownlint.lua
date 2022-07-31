return {
    rootMarkers = {
        ".markdownlint.json"
    },
    lintCommand = "markdownlint -c ./.markdownlint.json -s",
    lintStdin = true,
    lintFormats = {
        "%f:%l:%c %m",
        "%f:%l %m",
        "%f: %l: %m"
    }
}
