return {
    {
       "amitds1997/remote-nvim.nvim",
       version = "*", -- Pin to GitHub releases
       dependencies = {
           "nvim-lua/plenary.nvim", -- For standard functions
           "MunifTanjim/nui.nvim", -- To build the plugin UI
           "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
       },
       config = true,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    wo = { wrap = true }, -- Wrap notifications
                },
            },
        },
        keys = {
            {
                "<leader>un",
                function()
                    Snacks.notifier.hide()
                end,
                desc = "Dismiss All Notifications",
            },
            {
                "<leader>bd",
                function()
                    Snacks.bufdelete()
                end,
                desc = "Delete Buffer",
            },
            {
                "<leader>tg",
                function()
                    Snacks.lazygit()
                end,
                desc = "Lazygit",
            },
            {
                "<leader>gb",
                function()
                    Snacks.git.blame_line()
                end,
                desc = "Git Blame Line",
            },
            {
                "<leader>gB",
                function()
                    Snacks.gitbrowse()
                end,
                desc = "Git Browse",
            },
            {
                "<leader>gf",
                function()
                    Snacks.lazygit.log_file()
                end,
                desc = "Lazygit Current File History",
            },
            {
                "<leader>gl",
                function()
                    Snacks.lazygit.log()
                end,
                desc = "Lazygit Log (cwd)",
            },
            {
                "<leader>cR",
                function()
                    Snacks.rename()
                end,
                desc = "Rename File",
            },
            {
                "<c-/>",
                function()
                    Snacks.terminal()
                end,
                desc = "Toggle Terminal",
            },
            {
                "<c-_>",
                function()
                    Snacks.terminal()
                end,
                desc = "which_key_ignore",
            },
            {
                "]]",
                function()
                    Snacks.words.jump(vim.v.count1)
                end,
                desc = "Next Reference",
            },
            {
                "[[",
                function()
                    Snacks.words.jump(-vim.v.count1)
                end,
                desc = "Prev Reference",
            },
            {
                "<leader>N",
                desc = "Neovim News",
                function()
                    Snacks.win({
                        file = vim.api.nvim_get_runtime_file(
                            "doc/news.txt",
                            false
                        )[1],
                        width = 0.6,
                        height = 0.6,
                        wo = {
                            spell = false,
                            wrap = false,
                            signcolumn = "yes",
                            statuscolumn = " ",
                            conceallevel = 3,
                        },
                    })
                end,
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command

                    -- Create some toggle mappings
                    Snacks.toggle
                        .option("spell", { name = "Spelling" })
                        :map("<leader>us")
                    Snacks.toggle
                        .option("wrap", { name = "Wrap" })
                        :map("<leader>uw")
                    Snacks.toggle
                        .option("relativenumber", { name = "Relative Number" })
                        :map("<leader>uL")
                    Snacks.toggle.diagnostics():map("<leader>ud")
                    Snacks.toggle.line_number():map("<leader>ul")
                    Snacks.toggle
                        .option(
                            "conceallevel",
                            {
                                off = 0,
                                on = vim.o.conceallevel > 0
                                        and vim.o.conceallevel
                                    or 2,
                            }
                        )
                        :map("<leader>uc")
                    Snacks.toggle.treesitter():map("<leader>uT")
                    Snacks.toggle
                        .option(
                            "background",
                            {
                                off = "light",
                                on = "dark",
                                name = "Dark Background",
                            }
                        )
                        :map("<leader>ub")
                    Snacks.toggle.inlay_hints():map("<leader>uh")
                end,
            })

            ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
            local progress = vim.defaulttable()
            vim.api.nvim_create_autocmd("LspProgress", {
              ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
              callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
                if not client or type(value) ~= "table" then
                  return
                end
                local p = progress[client.id]

                for i = 1, #p + 1 do
                  if i == #p + 1 or p[i].token == ev.data.params.token then
                    p[i] = {
                      token = ev.data.params.token,
                      msg = ("[%3d%%] %s%s"):format(
                        value.kind == "end" and 100 or value.percentage or 100,
                        value.title or "",
                        value.message and (" **%s**"):format(value.message) or ""
                      ),
                      done = value.kind == "end",
                    }
                    break
                  end
                end

                local msg = {} ---@type string[]
                progress[client.id] = vim.tbl_filter(function(v)
                  return table.insert(msg, v.msg) or not v.done
                end, p)

                local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                vim.notify(table.concat(msg, "\n"), "info", {
                  id = "lsp_progress",
                  title = client.name,
                  opts = function(notif)
                    notif.icon = #progress[client.id] == 0 and " "
                      or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                  end,
                })
              end,
            })
        end,
    },
    { "meznaric/key-analyzer.nvim", opts = {} },
    "shortcuts/no-neck-pain.nvim",
    {
        "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-neotest/neotest",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rouge8/neotest-rust",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-rust"),
                },
            })
        end,
    },
    {
        "aaronhallaert/continuous-testing.nvim",
        enabled = false,
        -- dev = true,
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("continuous-testing").setup({
                notify = true,
                run_tests_on_setup = true,
                framework_setup = {
                    ruby = {
                        test_tool = "rspec",
                        test_cmd = "bundle exec rspec %file",
                    },
                    javascript = {
                        test_tool = "vitest",
                        test_cmd = "yarn vitest run %file",
                        root_pattern = "tsconfig.json",
                    },
                },
                project_override = {
                    ["/Users/aaronhallaert/Developer/nephroflow/nephroflow-api"] = {
                        ruby = {
                            test_tool = "rspec",
                            test_cmd = "run_api -- bundle exec rspec %file",
                        },
                    },
                    ["/Users/aaronhallaert/Developer/nephroflow/link"] = {
                        ruby = {
                            test_tool = "rspec",
                            test_cmd = "docker-compose run --rm link bundle exec rspec %file",
                        },
                    },
                },
            })
        end,
    },
}
