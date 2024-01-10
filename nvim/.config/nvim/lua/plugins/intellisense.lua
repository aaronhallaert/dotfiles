return {
    {
        "RaafatTurki/hex.nvim",
        config = function()
            require("hex").setup()
        end,
    },
    {
        "folke/neodev.nvim",
        event = "BufReadPre",
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
        enabled = false,
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
        "aklt/plantuml-syntax",
    },
    {
        "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    },
    {
        "Civitasv/cmake-tools.nvim",
        config = function()
            require("cmake-tools").setup({
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
    -- {
    --     "echasnovski/mini.nvim",
    --     config = function()
    --         require("mini.doc").setup()
    --     end,
    --     event = "VeryLazy",
    -- },
}
