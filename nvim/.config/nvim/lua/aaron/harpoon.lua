require("harpoon").setup({
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
