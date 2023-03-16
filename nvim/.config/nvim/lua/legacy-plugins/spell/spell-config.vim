command! Spellstop :set nospell
command! Spellen :set spell spelllang=en spellfile=$HOME/dotfiles/nvim/.config/nvim/plugin/spell/en.utf8.add
command! Spellhi :hi SpellBad ctermfg=168 ctermbg=none cterm=undercurl
command! Spellnohi :hi SpellBad ctermfg=none ctermbg=none cterm=none
command! Spellnl :set spell spelllang=nl spellfile=$HOME/dotfiles/nvim/.config/nvim/plugin/spell/nl.utf8.add
