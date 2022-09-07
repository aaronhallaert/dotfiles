local group = vim.api.nvim_create_augroup("IntegratedTest", {clear = true})
local ns = vim.api.nvim_create_namespace "IntegratedTest"

local attach_to_buffer = function(bufnr, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        buffer = bufnr,
        group = group,
        callback = function()
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
                            for _, test_output in ipairs(test_outputs) do
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
                                end
                            end
                        end
                    end
                end
            })

        end
    })
end

vim.api.nvim_create_user_command("IntegratedTest", function()
    local bufnr = tonumber(vim.api.nvim_get_current_buf())

    local command =
        "run_api.sh -ni -- bundle exec rspec " .. vim.fn.expand("%") ..
            " --format json --no-fail-fast"

    attach_to_buffer(bufnr, command)
end, {})
