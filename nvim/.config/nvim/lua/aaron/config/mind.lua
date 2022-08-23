require'mind'.setup {
    persistence = {state_path = '~/mind/mind.json', data_dir = '~/mind/data'}
}

_G.open_journal = function()
    require'mind'.wrap_main_tree_fn(function(args)
        local path = vim.fn.strftime('/Journal/%Y/%b/%d')
        vim.notify(path)
        local _, node = require'mind.node'.get_node_by_path(args.tree, path,
                                                            true)

        if node == nil then
            vim.notify('cannot open journal 🙁', vim.log.levels.WARN)
            return
        end

        require'mind.commands'.open_data(args.tree, node, args.data_dir,
                                         args.opts)
        require'mind.state'.save_state(args.opts)
    end)
end

vim.api.nvim_set_keymap('n', '<leader>mj', ':lua open_journal()<CR>',
                        {noremap = true})

