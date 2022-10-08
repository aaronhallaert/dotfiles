return {
    rootMarkers = {
        ".eslintrc.js",
        "package.json",
    },
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
}
