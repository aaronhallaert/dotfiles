local nvim_lsp = require('lspconfig')


local on_attach = function(client, bufnr)
    cfg = {
      debug = true,
      log_path = "/tmp/lsp_signature.log",
      bind = true, -- This is mandatory, otherwise border config won't get registered.
                   -- If you want to hook lspsaga or other signature handler, pls set to false
      doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                     -- set to 0 if you DO NOT want any API comments be shown
                     -- This setting only take effect in insert mode, it does not affect signature help in normal
                     -- mode, 10 by default

      floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
      fix_pos = true,  -- set to true, the floating window will not auto-close until finish all parameters
      hint_enable = true, -- virtual hint enable
      hint_prefix = "🐼 ",  -- Panda for parameter
      hint_scheme = "String",
      use_lspsaga = false,  -- set to true if you want to use lspsaga popup
      hi_parameter = "Search", -- how your parameter will be highlight
      max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                       -- to view the hiding contents
      max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
      handler_opts = {
        border = "single"   -- double, single, shadow, none
      },
      extra_trigger_chars = {} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
      -- deprecate !!
      -- decorator = {"`", "`"}  -- this is no longer needed as nvim give me a handler and it allow me to highlight active parameter in floating_window

    }

    require'lsp_signature'.on_attach(cfg)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end


    vim.fn.sign_define("LspDiagnosticsSignError",
      {text = "", texthl = "GruvboxRed"})
    vim.fn.sign_define("LspDiagnosticsSignWarning",
      {text = "", texthl = "GruvboxYellow"})
    vim.fn.sign_define("LspDiagnosticsSignInformation",
      {text = "", texthl = "GruvboxBlue"})
    vim.fn.sign_define("LspDiagnosticsSignHint",
      {text = "", texthl = "GruvboxAqua"})

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            --virtual_text = {
            --prefix = "»",
            --spacing = 4,
            --},
            virtual_text = true,
            signs = true,
            update_in_insert = false,
        }
    )

    -- Mappings/shortcuts.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'H', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<localleader>ca', '<cmd>lua vim.lsp.buf.code_action({ diagnostics = vim.lsp.diagnostic.get_line_diagnostics()})<CR>', opts)
    buf_set_keymap('n', '<leader>is', '<Cmd>!eslint_d % --fix<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end
end



-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pylsp", "solargraph", "jsonls", "vimls" , "tsserver", "diagnosticls"}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs(servers) do

  if lsp == "solargraph" then
      nvim_lsp.solargraph.setup {
          capabilities = capabilities,
          on_attach = on_attach,
          --cmd = {"nc", "localhost", "7658"},
          filetypes = {"ruby", "rakefile"},
          root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git"),
          settings = {
              solargraph = {
                  autoformat = true,
                  completion = true,
                  diagnostic = true,
                  folding = true,
                  references = true,
                  rename = true,
                  symbols = true
              }
          }
      }
    elseif lsp == "tsserver" then
        -- disable formatting for typescript
        nvim_lsp.tsserver.setup {
            capabilities = capabilities,
            on_attach = function(client)
                client.resolved_capabilities.document_formatting = false,
                on_attach(client)
            end
        }
    elseif lsp == "diagnosticls" then
        local filetypes = {
            typescript = "eslint",
            typescriptreact = "eslint",
        }
        local linters = {
            eslint = {
                sourceName = "eslint",
                command = "eslint_d",
                rootPatterns = {".eslintrc.js", "package.json"},
                debounce = 100,
                args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
                parseJson = {
                    errorsRoot = "[0].messages",
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "${message} [${ruleId}]",
                    security = "severity"
                },
                securities = {[2] = "error", [1] = "warning"}
            }
        }
        local formatters = {
            prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
        }
        local formatFiletypes = {
            typescript = "prettier",
            typescriptreact = "prettier"
        }
        nvim_lsp.diagnosticls.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = vim.tbl_keys(filetypes),
            init_options = {
                filetypes = filetypes,
                linters = linters,
                formatters = formatters,
                formatFiletypes = formatFiletypes
            }
        }
    --elseif lsp == "pyright" then
        --local filetypes = {
            --python = "pycodestyle"
        --}
        --local linters = {
            --pycodestyle = {
                --sourceName = "pycodestyle",
                --command = "pycodestyle",
                --args = {"%filepath", "--format='%(row)d|%(col)d|%(code)s| %(text)s'"},
                --debounce = 100,
                --formatPattern = {
                    --"^(\\d+)|(\\d+)|(\\w)|(\\w).+|(.*)$",
                    --{
                        --line = 1,
                        --column = 2,
                        --message = {"[",3,"] ", 5},
                        --security = 4
                    --}
                --},
                --securities = {
                    --E = "error",
                    --W = "warning",
                    --F = "info",
                    --B = "hint",
                --}
            --}
        --}
        --local formatters = {
            --black = {command = "black", args = {"%filepath"}}
        --}
        --local formatFiletypes = {
            --python = "black"
        --}
        --nvim_lsp.pyright.setup {
            --on_attach = on_attach,
            --filetypes = vim.tbl_keys(filetypes),
            --init_options = {
                --filetypes = filetypes,
                --linters = linters,
                --formatters = formatters,
                --formatFiletypes = formatFiletypes
            --}
        --}
    else 
       nvim_lsp[lsp].setup { 
          capabilities = capabilities,
          on_attach = on_attach,
          root_dir = nvim_lsp.util.root_pattern(".git")
       }
   end

end

