require("iswap").setup {
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
