local M = {}
M.attach_to_ruby_buffer = function(bufnr, command, group, ns)
    local state = {bufnr = bufnr, tests = {}}
    vim.api.nvim_buf_create_user_command(bufnr, "TestLineDiag", function()
        local line = vim.fn.line "."
        for _, test in pairs(state.tests) do
            if test.line_number == line then
                vim.cmd.new()
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
                vim.api.nvim_buf_set_lines(vim.api.nvim_get_current_buf(), 0,
                    -1, false, output)

                vim.cmd("setlocal buftype=nofile")
                vim.cmd("setlocal bufhidden=hide")
                vim.cmd("setlocal nobl")
                vim.cmd("setlocal noswapfile")
                vim.cmd("setlocal noma")
            end
        end

    end, {})
    vim.api.nvim_create_autocmd("BufWritePost", {
        buffer = bufnr,
        group = group,
        callback = function()
            state.tests = {}
            vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
            vim.fn.jobstart(command, {
                -- pass stdout for every line
                stdout_buffered = true,
                -- consume every stdout line
                on_stdout = function(_, data)
                    for _, line in ipairs(data) do
                        if string.find(line, "version") then
                            local decoded_output = vim.json.decode(line)
                            local test_outputs = decoded_output.examples
                            local failed = {}
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
                        end
                    end
                end
            })

        end
    })
end
return M
