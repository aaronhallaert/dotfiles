command! Spellstop :set nospell
command! Spellen :set spell spelllang=en spellfile=$HOME/dotfiles/nvim/.config/nvim/plugin/spell/en.utf8.add
command! Spellhi :hi SpellBad ctermbg=none ctermfg=green
command! Spellnohi :hi SpellBad ctermbg=none ctermfg=none
command! Spellnl :set spell spelllang=nl spellfile=$HOME/dotfiles/nvim/.config/nvim/plugin/spell/nl.utf8.add
