local it_ruby = require('aaron.config.integrated_tests.it_ruby')
local group = vim.api.nvim_create_augroup("IntegratedTest", {clear = true})
local ns = vim.api.nvim_create_namespace "IntegratedTestNS"

vim.api.nvim_create_user_command("IntegratedTest", function()
    local bufnr = tonumber(vim.api.nvim_get_current_buf())

    local command = "run_api.sh -ni -- bundle exec spring rspec " ..
                        vim.fn.expand("%") .. " --format json --no-fail-fast"

    -- vitest run --root=src/main --reporter=default --reporter=json

    it_ruby.attach_to_ruby_buffer(bufnr, command, group, ns)
end, {})
