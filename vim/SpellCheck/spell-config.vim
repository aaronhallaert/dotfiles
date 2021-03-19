command! Spellstop :set nospell
command! Spellen :set spell spelllang=en spellfile=$HOME/dotfiles/vim/SpellCheck/en.utf8.add
command! Spellhi :hi SpellBad ctermbg=none ctermfg=green
command! Spellnohi :hi SpellBad ctermbg=none ctermfg=none
command! Spellnl :set spell spelllang=nl spellfile=$HOME/dotfiles/vim/SpellCheck/nl.utf8.add
