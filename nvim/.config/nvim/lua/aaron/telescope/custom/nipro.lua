local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local N = {}

-- NIPRO COMMANDS
local function start_api()
    vim.fn.jobstart("tmux send-keys -t nipro:api.1 'run_api.sh -- rails s' C-m")
end

local function open_api()
    vim.fn.jobstart("tmux send-keys -t nipro:api.1 'run_api.sh -- bash' C-m")
end

local function stop_api()
    vim.fn.jobstart("docker stop selfweb")
end

local function start_manager()
    vim.fn.jobstart("tmux send-keys -t nipro:manager.1 'yarn dev' C-m")
end

local function stop_manager()
    vim.fn.jobstart("tmux send-keys -t nipro:manager.1 C-c")
end

local function restore_api_database()
    require("harpoon.term").sendCommand(1, "restore_db.sh")
    require("harpoon.term").gotoTerminal(1)
end

local function migrate_api_database()
    vim.fn.jobstart("tmux send-keys -t nipro:api.1 C-c")
    vim.fn.jobstart(
        "tmux send-keys -t api -t 1 'run_api.sh -- rails db:migrate' C-m"
    )
end

local function api_status()
    local handle = io.popen("lsof -i -P -n | grep 3000 | grep LISTEN")
    local result = handle:read("*a")
    if result ~= "" then
        return " --- ON"
    else
        return " --- OFF"
    end
end

local function manager_status()
    local handle = io.popen("lsof -i -P -n | grep 8080 | grep LISTEN")
    local result = handle:read("*a")
    if result ~= "" then
        return " --- ON"
    else
        return " --- OFF"
    end
end

local function nipro_commands()
    return {
        { value = "Start API" .. api_status(), func = start_api },
        { value = "Stop API", func = stop_api },
        { value = "Open API container", func = open_api },
        { value = "Start Manager" .. manager_status(), func = start_manager },
        { value = "Stop Manager", func = stop_manager },
        { value = "Restore Database", func = restore_api_database },
        { value = "Migrate Database", func = migrate_api_database },
    }
end

local function execute_nipro_function(value)
    local funcs = nipro_commands()
    for _, v in pairs(funcs) do
        if v["value"] == value then
            v["func"]()
            return
        end
    end
end

local function map_item(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

function N.merge(M)
    function M.show_nipro_commands()
        -- local previewers = require('telescope.previewers')
        local pickers = require("telescope.pickers")
        local sorters = require("telescope.sorters")
        local finders = require("telescope.finders")
        pickers
            .new({
                results_title = "Nipro Commands",
                finder = finders.new_table(
                    map_item(nipro_commands(), function(item)
                        return item["value"]
                    end)
                ),
                sorter = sorters.get_fuzzy_file(),
                attach_mappings = function(_, map)
                    map("i", "<CR>", function(prompt_bufnr)
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry()
                        execute_nipro_function(selection.value)
                    end)

                    return true
                end,
            })
            :find()
    end

    return M
end

return N
