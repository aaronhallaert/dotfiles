require("legendary").setup({
    keymaps = {
        -- LSP keymaps
        {
            "gD",
            "<Cmd>lua vim.lsp.buf.declaration()<CR>",
            description = "Go to declaration",
            opts = { noremap = true, silent = true },
        },
        {
            "gd",
            "<Cmd>lua vim.lsp.buf.definition()<CR>",
            description = "Go to definition",
            opts = { noremap = true, silent = true },
        },
        {
            "H",
            "<Cmd>lua vim.lsp.buf.hover()<CR>",
            description = "Hover definition",
            opts = { noremap = true, silent = true },
        },
        {
            "gi",
            "<cmd>lua vim.lsp.buf.implementation()<CR>",
            description = "Go to implementation",
            opts = { noremap = true, silent = true },
        },
        {
            "<C-s>",
            "<cmd>lua vim.lsp.buf.signature_help()<CR>",
            description = "Show signature help",
            opts = { noremap = true, silent = true },
        },
        {
            "<space>wa",
            "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
            description = "Add workspace folder",
            opts = { noremap = true, silent = true },
        },
        {
            "<space>wr",
            "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
            description = "Remove workspace folder",
            opts = { noremap = true, silent = true },
        },
        {
            "<space>wl",
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
            description = "List workspace folders",
            opts = { noremap = true, silent = true },
        },
        {
            "<space>D",
            "<cmd>lua vim.lsp.buf.type_definition()<CR>",
            description = "Show type definition",
            opts = { noremap = true, silent = true },
        },

        {
            "<space>rn",
            "<cmd>lua vim.lsp.buf.rename()<CR>",
            description = "Rename variable / function",
            opts = { noremap = true, silent = true },
        },
        {
            "gtr",
            "<cmd>lua vim.lsp.buf.references()<CR>",
            description = "Show references",
            opts = { noremap = true, silent = true },
        },
        {
            "<space>e",
            "<cmd>lua vim.diagnostic.open_float()<CR>",
            description = "Open float",
            opts = { noremap = true, silent = true },
        },
        {
            "[d",
            "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
            description = "Go to previous diagnostic",
            opts = { noremap = true, silent = true },
        },
        {
            "]d",
            "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
            description = "Go to next diagnostic",
            opts = { noremap = true, silent = true },
        },
        {
            "<space>q",
            "<cmd>lua vim.diagnostic.setloclist()<CR>",
            description = "Set location list for diagnostics",
            opts = { noremap = true, silent = true },
        },
        {
            "<localleader>ca",
            "<cmd>lua vim.lsp.buf.code_action({ diagnostics = vim.lsp.diagnostic.get_line_diagnostics()})<CR>",
            description = "Show line diagnostics",
            opts = { noremap = true, silent = true },
        },
        {
            "<leader>is",
            "<Cmd>!eslint_d % --fix<CR>",
            description = "Sort imports",
            opts = { noremap = true, silent = true },
        },
        {
            "<space>f",
            "<cmd>lua require('aaron.utils').lsp_format_async()<CR>",
            description = "Format code",
            opts = { noremap = true, silent = true },
        },
    },

    commands = {},
    funcs = {},
    autocmds = {},
})
