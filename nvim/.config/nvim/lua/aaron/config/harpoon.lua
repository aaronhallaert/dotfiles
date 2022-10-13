local harpoon = require("harpoon")

harpoon.setup({})

-- Marks
vim.api.nvim_set_keymap(
    "n",
    "<C-h>",
    ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>ah",
    ':lua require("harpoon.mark").add_file()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>th",
    ':lua require("harpoon.mark").toggle_file()<CR>',
    { noremap = true }
)

-- Send commands
vim.api.nvim_set_keymap(
    "n",
    "st1",
    ':lua require("harpoon.term").sendCommand(1,1)<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>i<CR><c-\\><c-n>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "st2",
    ':lua require("harpoon.term").sendCommand(1,2)<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>i<CR><c-\\><c-n>',
    { noremap = true }
)

function _G.RunCommandInTerminal(
    command, --[[optional]]
    term
)
    if not term then
        term = 1
    end

    require("harpoon.term").sendCommand(term, command)
    require("harpoon.term").gotoTerminal(term)
end

-- NEPHROFLOW/NEPHROFLOW API
if
    string.find(
        vim.fn.getcwd(),
        "/Users/aaronhallaert/Developer/nephroflow/nephroflow%-api"
    )
then
    function _G.Get_test_command( --[[optional]]line)
        local test_file = vim.fn.getreg("%")
        local test_line = vim.api.nvim_win_get_cursor(0)[1]
        local test_position = test_file .. ":" .. test_line

        if not line then
            line = false
        end

        if line then
            return "bundle exec rspec " .. test_position
        else
            return "bundle exec rspec " .. test_file
        end
    end

    function _G.GetQFTestCommands()
        local result = ""
        local qflist = vim.fn.getqflist()
        for index, _ in ipairs(qflist) do
            result = result .. " " .. qflist[index]["text"]
        end
        return "bundle exec rspec" .. result
    end

    vim.api.nvim_set_keymap(
        "n",
        "stf",
        ':lua RunCommandInTerminal("run_api.sh -- " .. Get_test_command(false))<CR>',
        { noremap = true }
    )
    vim.api.nvim_set_keymap(
        "n",
        "stl",
        ':lua RunCommandInTerminal("run_api.sh -- " .. Get_test_command(true))<CR>',
        { noremap = true }
    )
    vim.api.nvim_set_keymap(
        "n",
        "stt",
        ':lua RunCommandInTerminal("run_api.sh -- bundle exec rspec")<CR>',
        { noremap = true }
    )
    vim.api.nvim_set_keymap(
        "n",
        "stq",
        ':lua RunCommandInTerminal("run_api.sh -- " .. GetQFTestCommands())<CR>',
        { noremap = true }
    )

    vim.api.nvim_set_keymap(
        "n",
        "sts",
        ':lua RunCommandInTerminal("run_api.sh -- rails s", 2)<CR>',
        { noremap = true }
    )
    vim.api.nvim_set_keymap(
        "n",
        "std",
        ':lua RunCommandInTerminal("run_api.sh -- pkill ruby && docker-compose down", 1)<CR>',
        { noremap = true }
    )
    vim.api.nvim_set_keymap(
        "n",
        "stc",
        ':lua RunCommandInTerminal("run_api.sh -- bash", 2)<CR>',
        { noremap = true }
    )
    vim.api.nvim_set_keymap(
        "n",
        "str",
        ':lua RunCommandInTerminal("restore_db.sh")<CR>',
        { noremap = true }
    )
end

-- NEPHROFLOW/ELECTRON_APPS
if
    string.find(
        vim.fn.getcwd(),
        "/Users/aaronhallaert/Developer/nephroflow/electron%-apps"
    )
then
    vim.api.nvim_set_keymap(
        "n",
        "stk",
        ':lua RunCommandInTerminal("yarn dev --filter=nephroflow-kiosk...")<CR>',
        { noremap = true }
    )

    vim.api.nvim_set_keymap(
        "n",
        "sti",
        ':lua RunCommandInTerminal("yarn dev --filter=nephroflow-id...")<CR>',
        { noremap = true }
    )

    vim.api.nvim_set_keymap(
        "n",
        "sty",
        ':lua RunCommandInTerminal("yarn install")<CR>',
        { noremap = true }
    )

    vim.api.nvim_set_keymap(
        "n",
        "stt",
        ':lua RunCommandInTerminal("yarn test:typecheck")<CR>',
        { noremap = true }
    )
end

-- NEPHROFLOW/LINK
if
    string.find(
        vim.fn.getcwd(),
        "/Users/aaronhallaert/Developer/nephroflow/link"
    )
then
    function _G.RunSimulator()
        require("harpoon.tmux").sendCommand(
            "3",
            "docker-compose run --rm --service-ports --name sim dialysis_simulator"
        )
        require("harpoon.tmux").sendCommand(
            "1",
            "docker-compose run --rm --service-ports --name channel_host channel_host"
        )
        require("harpoon.tmux").sendCommand(
            "2",
            "docker-compose run --rm --service-ports --name processor_host processor_host"
        )
    end

    function _G.StopSimulator()
        vim.fn.jobstart("docker stop channel_host")
        vim.fn.jobstart("docker stop processor_host")
        vim.fn.jobstart("docker stop sim")
    end

    vim.api.nvim_set_keymap(
        "n",
        "sts",
        ":lua RunSimulator()<CR>",
        { noremap = true }
    )

    vim.api.nvim_set_keymap(
        "n",
        "stq",
        ":lua StopSimulator()<CR>",
        { noremap = true }
    )
end

-- NAVIGATION
vim.api.nvim_set_keymap(
    "n",
    "gt",
    ':lua require("harpoon.term").gotoTerminal(1)<CR>',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "g1",
    ':lua require("harpoon.ui").nav_file(1)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "g2",
    ':lua require("harpoon.ui").nav_file(2)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "g3",
    ':lua require("harpoon.ui").nav_file(3)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "g4",
    ':lua require("harpoon.ui").nav_file(4)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "g5",
    ':lua require("harpoon.ui").nav_file(5)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "g6",
    ':lua require("harpoon.ui").nav_file(6)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "g7",
    ':lua require("harpoon.ui").nav_file(7)<CR>',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "gn",
    ':lua require("harpoon.ui").nav_next()<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "gp",
    ':lua require("harpoon.ui").nav_prev()<CR>',
    { noremap = true }
)
