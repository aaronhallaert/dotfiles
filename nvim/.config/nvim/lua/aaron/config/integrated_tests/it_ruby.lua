local Job = require "plenary.job"
local M = {}

M.attach_to_ruby_buffer = function(bufnr, command, group, ns)
    local state = {bufnr = bufnr, tests = {}}
    vim.api.nvim_buf_create_user_command(bufnr, "TestLineDiag", function()
        local line = vim.fn.line "."
        for _, test in pairs(state.tests) do
            if test.line_number == line then
                local output = {}
                table.insert(output, test.exception.class)
                table.insert(output, "")
                for s in test.exception.message:gmatch("[^\r\n]+") do
                    table.insert(output, s)
                end
                table.insert(output, "")
                for _, s in ipairs(test.exception.backtrace) do
                    s = s:gsub('/srv/', '')
                    table.insert(output, s)
                end

                local width = vim.api.nvim_get_option("columns")
                local height = vim.api.nvim_get_option("lines")

                local win_height = math.ceil(height * 0.8 - 4)
                local win_width = math.ceil(width * 0.8)

                local row = math.ceil((height - win_height) / 2 - 1)
                local col = math.ceil((width - win_width) / 2)

                local opts = {
                    style = "minimal",
                    relative = "editor",
                    width = win_width,
                    height = win_height,
                    row = row,
                    col = col,
                    border = "rounded"
                }

                local buffer = vim.api.nvim_create_buf(false, 'nomodified')
                vim.api.nvim_buf_set_lines(buffer, 0, -1, false, output)
                vim.api.nvim_open_win(buffer, true, opts)

            end
        end

    end, {})

    local splitted_command = {}
    for str in command:gmatch("[^ ]+") do table.insert(splitted_command, str) end
    -- local first_command = table.remove(splitted_command, 1)
    local args = splitted_command

    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.rb",
        group = group,
        callback = function()
            state.tests = {}

            vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
            require('significant').start_animated_sign(1, 'dots4', 100, bufnr)

            Job:new({
                command = "bash",
                args = args,
                on_exit = function(j, res_value)
                    if (res_value == 1 or res_value == 0) then
                        local result = table.concat(j:result(), "\n")
                        local decoded_output = vim.json.decode(result)
                        local test_outputs = decoded_output.examples
                        local failed = {}
                        vim.schedule(function()
                            require('significant').stop_animated_sign(1, bufnr)

                            for _, test_output in ipairs(test_outputs) do
                                table.insert(state.tests, test_output)
                                if test_output.status == "passed" then
                                    local text = {"✅"}
                                    vim.api.nvim_buf_set_extmark(bufnr, ns,
                                        test_output.line_number - 1, 0, {
                                            virt_text = {text}
                                        })

                                end
                                if test_output.status ~= "passed" then
                                    local text = {"🔴"}
                                    vim.api.nvim_buf_set_extmark(bufnr, ns,
                                        test_output.line_number - 1, 0, {
                                            virt_text = {text}
                                        })

                                    table.insert(failed, {
                                        bufnr = bufnr,
                                        lnum = test_output.line_number - 1,
                                        col = 0,
                                        severity = vim.diagnostic.severity.ERROR,
                                        source = "rspec",
                                        message = "Test Failed"
                                    })
                                end

                                vim.diagnostic.set(ns, bufnr, failed, {})
                            end
                            vim.fn.sign_unplace("", {buffer = bufnr})
                        end)
                    else
                        error(table.concat(j:result(), "\n"))
                    end

                end
            }):start()
            -- vim.fn.jobstart(command, {
            --     -- pass stdout for every line
            --     stdout_buffered = true,
            --     -- consume every stdout line
            --     on_stdout = function(_, data)
            --         for _, line in ipairs(data) do
            --             if string.find(line, "version") then
            --                 local decoded_output = vim.json.decode(line)
            --                 local test_outputs = decoded_output.examples
            --                 local failed = {}
            --                 for _, test_output in ipairs(test_outputs) do
            --                     table.insert(state.tests, test_output)
            --                     if test_output.status == "passed" then
            --                         local text = {"✅"}
            --                         vim.api.nvim_buf_set_extmark(bufnr, ns,
            --                             test_output.line_number - 1, 0, {
            --                                 virt_text = {text}
            --                             })
            --
            --                     end
            --                     if test_output.status ~= "passed" then
            --                         local text = {"🔴"}
            --                         vim.api.nvim_buf_set_extmark(bufnr, ns,
            --                             test_output.line_number - 1, 0, {
            --                                 virt_text = {text}
            --                             })
            --
            --                         table.insert(failed, {
            --                             bufnr = bufnr,
            --                             lnum = test_output.line_number - 1,
            --                             col = 0,
            --                             severity = vim.diagnostic.severity.ERROR,
            --                             source = "rspec",
            --                             message = "Test Failed"
            --                         })
            --                     end
            --
            --                     vim.diagnostic.set(ns, bufnr, failed, {})
            --
            --                 end
            --             end
            --         end
            --     end
            -- })
        end
    })
end
return M
