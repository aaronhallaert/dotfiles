return {
    {
        "3rd/image.nvim",
        enabled = false,
        config = function()
            require("image").setup({
                backend = "kitty",
                processor = "magick_rock", -- or "magick_cli"
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = false,
                        floating_windows = false, -- if true, images will be rendered in floating markdown windows
                        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                    },
                    neorg = {
                        enabled = true,
                        filetypes = { "norg" },
                    },
                    typst = {
                        enabled = true,
                        filetypes = { "typst" },
                    },
                    html = {
                        enabled = false,
                    },
                    css = {
                        enabled = false,
                    },
                },
                max_width = nil,
                max_height = nil,
                max_width_window_percentage = nil,
                max_height_window_percentage = 50,
                window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
                window_overlap_clear_ft_ignore = {
                    "cmp_menu",
                    "cmp_docs",
                    "snacks_notif",
                    "scrollview",
                    "scrollview_sign",
                },
                editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
                tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
                hijack_file_patterns = {
                    "*.png",
                    "*.jpg",
                    "*.jpeg",
                    "*.gif",
                    "*.webp",
                    "*.avif",
                }, -- render image files as images when opened
            })
        end,
    },

    {
        "3rd/diagram.nvim",
        enabled = false,
        dependencies = {
            "3rd/image.nvim",
        },
        opts = { -- you can just pass {}, defaults below
            renderer_options = {
                mermaid = {
                    background = nil, -- nil | "transparent" | "white" | "#hex"
                    theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
                    scale = 1, -- nil | 1 (default) | 2  | 3 | ...
                    width = nil, -- nil | 800 | 400 | ...
                    height = nil, -- nil | 600 | 300 | ...
                },
                plantuml = {
                    charset = nil,
                },
                d2 = {
                    theme_id = nil,
                    dark_theme_id = nil,
                    scale = nil,
                    layout = nil,
                    sketch = nil,
                },
                gnuplot = {
                    size = nil, -- nil | "800,600" | ...
                    font = nil, -- nil | "Arial,12" | ...
                    theme = nil, -- nil | "light" | "dark" | custom theme string
                },
            },
        },
    },
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
            picker = { enabled = true },
            explorer = {
                enabled = true,
                replace_netrw = true,
                follow_file = true,
                hidden = true,
                ignored = true,
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
                "<leader>pv",
                function()
                    Snacks.explorer()
                end,
                desc = "Dismiss All Notifications",
            },
            -- Grep
            {
                "<leader>sb",
                function()
                    Snacks.picker.lines()
                end,
                desc = "Buffer Lines",
            },
            {
                "<leader>sB",
                function()
                    Snacks.picker.grep_buffers()
                end,
                desc = "Grep Open Buffers",
            },
            {
                "<leader>sg",
                function()
                    Snacks.picker.grep({ hidden = true })
                end,
                desc = "Grep",
            },
            {
                "fiw",
                function()
                    Snacks.picker.grep_word()
                end,
                desc = "Visual selection or word",
                mode = { "n", "x" },
            },
            -- find
            {
                "<leader>fb",
                function()
                    Snacks.picker.buffers()
                end,
                desc = "Buffers",
            },
            {
                "<leader>fc",
                function()
                    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
                end,
                desc = "Find Config File",
            },
            {
                "<leader>ff",
                function()
                    Snacks.picker.files()
                end,
                desc = "Find Files",
            },
            {
                "<leader>fg",
                function()
                    Snacks.picker.git_files()
                end,
                desc = "Find Git Files",
            },
            {
                "<leader>fp",
                function()
                    Snacks.picker.projects()
                end,
                desc = "Projects",
            },
            {
                "<leader>fr",
                function()
                    Snacks.picker.recent()
                end,
                desc = "Recent",
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
                        .option("conceallevel", {
                            off = 0,
                            on = vim.o.conceallevel > 0 and vim.o.conceallevel
                                or 2,
                        })
                        :map("<leader>uc")
                    Snacks.toggle.treesitter():map("<leader>uT")
                    Snacks.toggle
                        .option("background", {
                            off = "light",
                            on = "dark",
                            name = "Dark Background",
                        })
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
                        if
                            i == #p + 1
                            or p[i].token == ev.data.params.token
                        then
                            p[i] = {
                                token = ev.data.params.token,
                                msg = ("[%3d%%] %s%s"):format(
                                    value.kind == "end" and 100
                                        or value.percentage
                                        or 100,
                                    value.title or "",
                                    value.message
                                            and (" **%s**"):format(
                                                value.message
                                            )
                                        or ""
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

                    local spinner = {
                        "⠋",
                        "⠙",
                        "⠹",
                        "⠸",
                        "⠼",
                        "⠴",
                        "⠦",
                        "⠧",
                        "⠇",
                        "⠏",
                    }
                    vim.notify(table.concat(msg, "\n"), "info", {
                        id = "lsp_progress",
                        title = client.name,
                        opts = function(notif)
                            notif.icon = #progress[client.id] == 0 and " "
                                or spinner[math.floor(
                                    vim.uv.hrtime() / (1e6 * 80)
                                ) % #spinner + 1]
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
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
}
