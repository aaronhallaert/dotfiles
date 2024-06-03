return {
    {
        "RaafatTurki/hex.nvim",
        config = function()
            require("hex").setup()
        end,
    },
    {
        enabled =false,
        "folke/neodev.nvim",
        event = "BufReadPre",
    },
    {
        "folke/lazydev.nvim",
        event = "BufReadPre",
        config = function()
            require("lazydev").setup()
        end
    },

    -- diagnostic overview
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end,
        event = "VeryLazy",
    },

    -- installing lsp servers, formatters, linters...
    -- code understanding (diagnostic + navigation)
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
            require("lsp-config")
        end,
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        -- event = "BufReadPre",
    },
    -- lsp for Java
    {
        "mfussenegger/nvim-jdtls",
        lazy = true,
    },

    -- code understanding (highlight...)
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPre",
        build = ":TSUpdate",
        config = function()
            require("plugins.config.treesitter")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
    },

    {
        "utilyre/barbecue.nvim",
        event = "BufReadPre",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            -- "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
            show_dirname = false,
        },
    },
    -- TODO: Revisit on nvim 0.10.0
    -- {
    --     "Bekaboo/dropbar.nvim",
    -- },
    --
    {
        "nvim-treesitter/playground",
        event = "VeryLazy",
    },

    {
        "j-hui/fidget.nvim",
        event = "BufReadPre",
        branch = "legacy",
        config = function()
            require("fidget").setup({})
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
        event = "VeryLazy",
    },
    {
        "zbirenbaum/copilot.lua",
        enabled = true,
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = false,
                    debounce = 75,
                    keymap = {
                        accept = "<C-a>",
                        accept_word = false,
                        accept_line = false,
                        next = "<C-]>",
                        prev = "<C-[>",
                        dismiss = "<C-j>",
                    },
                },
            })
        end,
    },

    {
        "CopilotC-Nvim/CopilotChat.nvim",
        enabled = true,
        dependencies = { "zbirenbaum/copilot.lua", "nvim-lua/plenary.nvim" },
        config = function()
            require("CopilotChat").setup({
                show_help = true, -- Show help text for CopilotChatInPlace, default: yes
                debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
                disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
                -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
                prompts = { -- Set dynamic prompts for CopilotChat commands
                    Explain = "Explain how it works.",
                    Tests = "Briefly explain how the selected code works, then generate unit tests.",
                },
            })
        end,
        build = function()
            vim.notify(
                "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
            )
        end,
        event = "VeryLazy",
        keys = {
            {
                "<leader>cce",
                "<cmd>CopilotChatExplain<cr>",
                desc = "CopilotChat - Explain code",
            },
            {
                "<leader>cct",
                "<cmd>CopilotChatTests<cr>",
                desc = "CopilotChat - Generate tests",
            },
            {
                "<leader>ccT",
                "<cmd>CopilotChatVsplitToggle<cr>",
                desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
            },
            {
                "<leader>ccv",
                ":CopilotChatVisual",
                mode = "x",
                desc = "CopilotChat - Open in vertical split",
            },
            {
                "<leader>ccx",
                ":CopilotChatInPlace<cr>",
                mode = "x",
                desc = "CopilotChat - Run in-place code",
            },
            {
                "<leader>ccf",
                "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
                desc = "CopilotChat - Fix diagnostic",
            },
            {
                "<leader>ccr",
                "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
                desc = "CopilotChat - Reset chat history and clear buffer",
            },
        },
    },

    --------------- DEBUGGING -------------------
    -- Lua
    {
        "folke/todo-comments.nvim",
        event = "BufReadPre",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end,
    },

    ------------- LANGUAGE SPECIFIC -------------
    -- MARKDOWN
    { "mzlogin/vim-markdown-toc", event = "BufReadPre" },
    {
        "lervag/vimtex",
        config = function()
            -- Set the default viewer for vimtex to Skim
            vim.g.vimtex_view_general_viewer = "open -a Skim"

            -- Set options for the general viewer command
            -- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

            -- Check if SumatraPDF is available and configure vimtex to use it as the viewer
            if vim.fn.executable("SumatraPDF.exe") == 1 then
                vim.g.vimtex_view_general_viewer = "SumatraPDF.exe"
                vim.g.latex_view_method = "SumatraPDF.exe"

                -- Set options for the SumatraPDF viewer command
                vim.g.vimtex_view_general_options = "-reuse-instance @pdf  -forward-search @tex @line"
                    .. "-inverse-search"
                    .. vim.fn.exepath(vim.fn.expand("$VIMRUNTIME\\gvim.exe"))
                    .. "--servername"
                    .. vim.fn.servername()
                    .. '"%%f" -c "%%l"'

                -- Set options for the latexmk command when using the SumatraPDF viewer
                vim.g.vimtex_view_general_options_latexmk = "-reuse-instance"
            end

            -- Set the TeX flavor to LaTeX
            vim.g.tex_flavor = "latex"

            -- Set the compiler for vimtex to latexmk and enable continuous mode
            vim.g.vimtex_compiler_latexmk = { continuous = 1 }
        end,
        event = "BufReadPre",
    },
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
            vim.api.nvim_set_keymap(
                "n",
                "<leader>md",
                ":MarkdownPreview<CR>",
                { noremap = true, silent = true }
            )
        end,
        config = function()
            vim.g.mkdp_filetypes = { "markdown", "plantuml" }
        end,
        -- event = "BufReadPre",
        ft = { "markdown", "plantuml" },
    },

    {
        "vinnymeller/swagger-preview.nvim",
        build = "npm install -g swagger-ui-watcher",
        config = function()
            require("swagger-preview").setup({
                -- The port to run the preview server on
                port = 8111,
                -- The host to run the preview server on
                host = "localhost",
            })
        end,
    },
    {
        "aklt/plantuml-syntax",
    },
    {
        "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    },
    {
        "Civitasv/cmake-tools.nvim",
        config = function()
            require("cmake-tools").setup({
                cmake_build_directory = "build/",
                cmake_kits_path = "/home/aaron/.local/share/CMakeTools/cmake-tools-kits.json",
            })
        end,
    },

    -- RUBY ON RAILS
    { "tpope/vim-rails", event = "LspAttach" },

    -- { "ziontee113/query-secretary", event = "VeryLazy" },
    -- {
    --     "simrat39/rust-tools.nvim",
    --     config = function()
    --         require("rust-tools").setup()
    --     end,
    -- },

    {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        event = "VeryLazy",
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command = "/home/aaron/Programs/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7",
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = true,
                },
            }

            vim.api.nvim_set_keymap(
                "n",
                "<leader>dc",
                "<cmd>lua require('dap').continue()<cr>",
                { noremap = true, silent = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<leader>dp",
                "<cmd>lua require('dap').toggle_breakpoint()<cr>",
                { noremap = true, silent = true }
            )
            vim.api.nvim_set_keymap(
                "n",
                "<leader>ds",
                "<cmd>lua require('dap').step_over()<cr>",
                { noremap = true, silent = true }
            )
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("dapui").setup()
        end,
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    },
    -- {
    --     "echasnovski/mini.nvim",
    --     config = function()
    --         require("mini.doc").setup()
    --     end,
    --     event = "VeryLazy",
    -- },
}
