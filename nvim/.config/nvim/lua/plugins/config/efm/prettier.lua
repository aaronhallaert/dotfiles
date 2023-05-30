return {
    rootMarkers = {
        ".eslintrc.js",
        ".prettierrc.json",
        "package.json",
    },
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
}
