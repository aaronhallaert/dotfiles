require("aaron.telescope")
require("aaron.lsp")
require("aaron.cmp")
require("harpoon").setup({})
require("aaron.telekasten")
require("aaron.treesitter")
require("aaron.nvim-tree")
-- require("aaron.feline")
require("gitsigns").setup()
-- require("octo").setup()
require('Comment').setup()
require('cinnamon').setup()

require('pretty-fold').setup()
require('pretty-fold.preview').setup()

require("indent_blankline").setup {
    use_treesitter = true,
    char_list = {'|', '¦', '┆', '┊'},
    show_current_context = true,
    show_current_context_start = true
}

require('iswap').setup {
    -- The keys that will be used as a selection, in order
    -- ('asdfghjklqwertyuiopzxcvbnm' by default)
    keys = 'qwertyuiop',

    -- Grey out the rest of the text when making a selection
    -- (enabled by default)
    grey = 'disable',

    -- Highlight group for the sniping value (asdf etc.)
    -- default 'Search'
    hl_snipe = 'ErrorMsg',

    -- Highlight group for the visual selection of terms
    -- default 'Visual'
    hl_selection = 'WarningMsg',

    -- Highlight group for the greyed background
    -- default 'Comment'
    hl_grey = 'LineNr',

    -- Highlight priority for the greyed background
    -- default '1000'
    hl_grey_priority = '200',

    -- Automatically swap with only two arguments
    -- default nil
    autoswap = true
}

require'treesitter-context'.setup {
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class', 'function', 'method'
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        } -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20 -- The Z-index of the context window
}

require('litee.lib').setup({tree = {icon_set = "nerd"}, panel = {orientation = "right", panel_size = 50}})
require('litee.gh').setup({
    -- deprecated, around for compatability for now.
    jump_mode = "invoking",
    -- remap the arrow keys to resize any litee.nvim windows.
    map_resize_keys = false,
    -- do not map any keys inside any gh.nvim buffers.
    disable_keymaps = false,
    -- the icon set to use.
    icon_set = "nerd",
    -- any custom icons to use.
    icon_set_custom = nil,
    -- whether to register the @username and #issue_number omnifunc completion
    -- in buffers which start with .git/
    git_buffer_completion = true,
    -- defines keymaps in gh.nvim buffers.
    keymaps = {
        -- when inside a gh.nvim panel, this key will open a node if it has
        -- any futher functionality. for example, hitting <CR> on a commit node
        -- will open the commit's changed files in a new gh.nvim panel.
        open = "<CR>",
        -- when inside a gh.nvim panel, expand a collapsed node
        expand = "zo",
        -- when inside a gh.nvim panel, collpased and expanded node
        collapse = "zc",
        -- when cursor is over a "#1234" formatted issue or PR, open its details
        -- and comments in a new tab.
        goto_issue = "gd",
        -- show any details about a node, typically, this reveals commit messages
        -- and submitted review bodys.
        details = "d",
        -- inside a convo buffer, submit a comment
        submit_comment = "<C-s>",
        -- inside a convo buffer, when your cursor is ontop of a comment, open
        -- up a set of actions that can be performed.
        actions = "<C-a>",
        -- inside a thread convo buffer, resolve the thread.
        resolve_thread = "<C-r>",
        -- inside a gh.nvim panel, if possible, open the node's web URL in your
        -- browser. useful particularily for digging into external failed CI
        -- checks.
        goto_web = "gx"
    }
})
