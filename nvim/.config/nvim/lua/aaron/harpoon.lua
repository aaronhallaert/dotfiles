require("harpoon").setup({
    mark_branch = true,
    projects = {
        ["$HOME/Developer/nephroflow/nephroflow-api"] = {
            term = {
                cmds = {
                    "docker exec -it selfweb bash",
                }
            }
        }
    }
})
