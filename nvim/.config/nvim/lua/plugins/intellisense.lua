return {
    {
        "RaafatTurki/hex.nvim",
        config = function()
            require("hex").setup()
        end,
    },
    {
        enabled = false,
        "folke/neodev.nvim",
        event = "BufReadPre",
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        config = function()
            require("lazydev").setup()
        end,
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
            "https://gitlab.com/schrieveslaach/sonarlint.nvim",
        },
        -- event = "BufReadPre",
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        enabled = false,
        event = "VeryLazy",
        config = function()
            require("tiny-inline-diagnostic").setup()
        end,
    },
    -- lsp for Java
    {
        "mfussenegger/nvim-jdtls",
        enabled = false,
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
      "folke/sidekick.nvim",
      enabled = true,
      opts = {
        -- add any options here
        cli = {
          mux = {
            backend = "tmux",
            enabled = true,
          },
        },
      },
      -- stylua: ignore
      keys = {
        {
          "<tab>",
          function()
            -- if there is a next edit, jump to it, otherwise apply it if any
            if not require("sidekick").nes_jump_or_apply() then
              return "<Tab>" -- fallback to normal tab
            end
          end,
          expr = true,
          desc = "Goto/Apply Next Edit Suggestion",
        },
        {
          "<c-space>",
          function() require("sidekick.cli").toggle() end,
          desc = "Sidekick Toggle",
          mode = { "n", "t", "i", "x" },
        },
        {
          "<leader>aa",
          function() require("sidekick.cli").toggle() end,
          desc = "Sidekick Toggle CLI",
        },
        {
          "<leader>as",
          function() require("sidekick.cli").select() end,
          -- Or to select only installed tools:
          -- require("sidekick.cli").select({ filter = { installed = true } })
          desc = "Select CLI",
        },
        {
          "<leader>at",
          function() require("sidekick.cli").send({ msg = "{this}" }) end,
          mode = { "x", "n" },
          desc = "Send This",
        },
        {
          "<leader>af",
          function() require("sidekick.cli").send({ msg = "{file}" }) end,
          desc = "Send File",
        },
        {
          "<leader>av",
          function() require("sidekick.cli").send({ msg = "{selection}" }) end,
          mode = { "x" },
          desc = "Send Visual Selection",
        },
        {
          "<leader>ap",
          function() require("sidekick.cli").prompt() end,
          mode = { "n", "x" },
          desc = "Sidekick Select Prompt",
        },
        -- Example of a keybinding to open Claude directly
        {
          "<leader>ac",
          function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
          desc = "Sidekick Toggle Claude",
        },
      },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        enabled = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
    },

    {
        "utilyre/barbecue.nvim",
        enabled = false,
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
    {
        "Bekaboo/dropbar.nvim",
    },
    --
    {
        "nvim-treesitter/playground",
        enabled = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
    },

    {
        "j-hui/fidget.nvim",
        enabled = false,
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
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<C-l>",
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
    --------------- DEBUGGING -------------------
    -- Lua
    {
        "folke/todo-comments.nvim",
        enabled = false,
        event = "BufReadPre",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end,
    },

    ------------- LANGUAGE SPECIFIC -------------
    -- MARKDOWN
    {
        "lervag/vimtex",
        enabled = false,
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
        "mistweaverco/kulala.nvim",
        enabled = false,
        config = function()
            -- Setup is required, even if you don't pass any options
            require("kulala").setup({
                default_view = "headers_body",
            })
        end,
    },
    -- {
    --     "MeanderingProgrammer/markdown.nvim",
    --     name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "echasnovski/mini.nvim",
    --     }, -- if you use the mini.nvim suite
    --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    --     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    --     config = function()
    --         require("render-markdown").setup({})
    --     end,
    -- },
    {
        "OXY2DEV/markview.nvim",
        enabled = false,
        config = function()
            require("markview").setup({})
        end,
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
    { "tpope/vim-rails", enabled = false, event = "LspAttach" },

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
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = {
                    "--interpreter=dap",
                    "--eval-command",
                    "set print pretty on",
                },
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "gdb",
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

            vim.api.nvim_set_keymap(
                "n",
                "<leader>dt",
                "<cmd>lua require('dapui').toggle()<cr>",
                { noremap = true, silent = true }
            )
        end,
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    },
    {
        "nvim-flutter/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
        config = true,
    },
}
