local ls = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load({
    paths = {
        "/Users/aaronhallaert/.vim/my-vim-snippets/LuaSnip/vscode-style-snippets/",
    },
})

vim.api.nvim_set_keymap(
    "i",
    "<C-n>",
    '<Esc>:lua require("luasnip").jump(1)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<C-p>",
    '<Esc>:lua require("luasnip").jump(-1)<CR>',
    { noremap = true }
)

-- snippet creator
local snippet = ls.s
-- format node
local fmt = require("luasnip.extras.fmt").fmt
-- insert node
local i = ls.insert_node
-- text node
local t = ls.text_node
-- repeats a node
local rep = require("luasnip.extras").rep
-- choice node
local c = ls.choice_node
-- function node
local f = ls.function_node

ls.add_snippets("lua", {
    snippet(
        "req",
        fmt("local {} = require('{}')", { i(1, "default"), rep(1) })
    ),
    snippet(
        "keymap",
        fmt("vim.api.nvim_set_keymap('{}', '{}', '{}', {{{}}})", {
            c(1, { t("i"), t("n"), t("v") }),
            i(2, ""),
            i(3, ""),
            i(0, "noremap = true"),
        })
    ),
})

local same = function(index)
    return f(function(arg)
        return arg[1]
    end, { index })
end

ls.add_snippets("all", {

    -- todo/fixme snippet
    snippet(
        "sametest",
        fmt(
            [[
        {}: {}
    ]],
            { i(1), same(1) }
        )
    ),

    -- todo/fixme snippet
    snippet(
        "TODO",
        fmt(
            [[
        {}: {}
    ]],
            { c(1, { t("TODO"), t("FIXME") }), i(0) }
        )
    ),

    -- Return current time
    snippet(
        "time",
        fmt(
            [[
    {}
    ]],
            { f(function()
                return os.date("%D - %H:%M")
            end) }
        )
    ),
})

-- For changing choices in choiceNodes (not strictly necessary for a basic setup).
vim.cmd(
    "imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'"
)
vim.cmd(
    "smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'"
)
