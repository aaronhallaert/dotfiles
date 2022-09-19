local M = {}
M.setup = function(config)
    local use = config.use
    use 'tpope/vim-obsession'
    use 'renerocksai/calendar-vim'
    use {
        'renerocksai/telekasten.nvim',
        config = function()
            require("aaron.config.telekasten") -- markdown notes
        end
    }
    use {'nvim-treesitter/nvim-treesitter'}
    use {
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup_ts_grammar()
            require('orgmode').setup {
                org_agenda_files = {'~/org/**/*'},
                org_default_notes_file = '~/org/refile.org',
                org_template = "",
                org_capture_templates = {
                    t = {
                        description = 'Task',
                        template = '* TODO %?\n %u',
                        target = '~/org/todos.org'
                    },
                    j = {
                        description = 'Journal',
                        template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
                        target = '~/org/journal.org'
                    }
                }
            }
        end
    }
    use {
        'mhinz/vim-startify',
        config = function() require('aaron.config.startify') end
    }
end
return M
