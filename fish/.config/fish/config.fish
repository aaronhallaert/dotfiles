set fish_greeting
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
starship init fish | source

# Cursor styles
set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

# fix gpg from tty
set -gx GPG_TTY (tty)

# Path
set -x fish_user_paths
fish_add_path /bin
fish_add_path $HOME/dotfiles/usr/scripts
fish_add_path $HOME/dotfiles/usr/scripts/screens
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin
fish_add_path ~/.local/bin
fish_add_path ~/.luarocks/bin
fish_add_path ~/Library/Python/3.{8,9}/bin
fish_add_path /usr/local/opt/sqlite/bin
fish_add_path /usr/local/sbin
fish_add_path ~/.gem/ruby/2.6.0/bin
fish_add_path ~/.local/bin/pnpm-bins
fish_add_path ~/.local/share/bob-nvim/bin
fish_add_path ~/.local/share/bob-nvim/nvim-linux64/bin
fish_add_path /var/lib/flatpak/exports/bin/
fish_add_path ~/.dotnet/tools
fish_add_path ~/.local/share/mise/shims

set -gx DENO_INSTALL "~/.deno"
fish_add_path ~/.deno/bin

set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

# Fish
set fish_emoji_width 2
alias ssh "TERM=xterm-256color command ssh"
alias mosh "TERM=xterm-256color command mosh"

zoxide init fish | source

# Emacs
# set -l emacs_path /Applications/Emacs.app/Contents/MacOS
# set -Ux EMACS $emacs_path/Emacs
fish_add_path ~/.emacs.d/bin
# alias emacs $EMACS

# Go
set -x GOPATH ~/go
fish_add_path $GOPATH $GOPATH/bin


fish_add_path -m /etc/profiles/per-user/folke/bin /run/current-system/sw/bin
# Exports
set -x LESS -rF
set -x COMPOSE_DOCKER_CLI_BUILD 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x DOTDROP_AUTOUPDATE no
set -x MANPAGER "nvim +Man!"
set -x MANROFFOPT -c
set -x OPENCV_LOG_LEVEL ERROR
#set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" # use bat to format man pages
#set -x MANPAGER "most" # use bat to format man pages
#
abbr -a --position anywhere --set-cursor -- -h "-h 2>&1 | bat --plain --language=help"
abbr j just

abbr ape "source ~/.virtualenvs/\$(bash -c 'ls ~/.virtualenvs' | fzf)/bin/activate.fish"
abbr vpnu "openvpn3 session-start --config ~/Documents/televic.ovpn"
abbr vpnd "openvpn3 session-manage --disconnect --path \$(openvpn3 sessions-list | grep Path | cut -d ':' -f2 | tr -d ' ')"



abbr kas 'SHELL=bash kas'
abbr toolbox 'SHELL=bash toolbox'

# Dnf
abbr dnfi 'sudo dnf install'
abbr dnfs 'sudo dnf search'
abbr dnfr 'sudo dnf remove'
abbr dnfu 'sudo dnf upgrade --refresh'

abbr celar 'clear'
# Tmux
abbr t tmux
abbr tc 'tmux attach'
abbr ta 'tmux attach -t'
abbr tad 'tmux attach -d -t'
abbr ts 'tmux new -s'
abbr tl 'tmux ls'
abbr tk 'tmux kill-session -t'
abbr two 'tmux kill-window -a'
abbr tpo 'tmux kill-pane -a'
abbr tso 'tmux kill-session -a'
abbr too 'tmux kill-session -a; tmux kill-window -a; tmux kill-pane -a'
abbr mux tmuxinator

# Files & Directories
abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
alias ls="eza --color=always --icons --group-directories-first"
alias la 'eza --color=always --icons --group-directories-first --all'
alias ll 'eza --color=always --icons --group-directories-first --all --long'
abbr l ll
abbr ncdu "ncdu --color dark"

# Editor
abbr vim nvim
abbr vi nvim
abbr v nvim
alias vimpager 'nvim - -c "lua require(\'util\').colorize()"'
abbr vd "VIM=~/projects/neovim nvim --luamod-dev"
abbr sv sudoedit
abbr vudo sudoedit
alias bt "coredumpctl -1 gdb -A '-ex \"bt\" -q -batch' 2>/dev/null | awk '/Program terminated with signal/,0' | bat -l cpp --no-pager --style plain"

# Dev
abbr topgit topgrade --only git_repos
abbr windows systemctl reboot --boot-loader-entry=auto-windows

abbr du gdu
abbr dotf "cd ~/dotfiles"
function wsa
    if pgrep -x "kitty" > /dev/null
        # Rename the tab if Kitty is running
        kitty @ set-tab-title "Workstation"
    end
    ssh -R 43022:localhost:22 workstation-aaron

    if pgrep -x "kitty" > /dev/null
        # Rename the tab if Kitty is running
        kitty @ set-tab-title "Laptop"
    end
end

abbr wts "git worktree list | awk -v pwd=\"\$(pwd)\" '\$1 != pwd {print \$1}' | xargs -I % sh -c '[ -z \"\$(tmux list-windows | grep \$(basename %))\" ] && tmux neww -n \$(basename %) -c %'"
abbr wto "git worktree list | awk -v pwd=\"\$(pwd)\" '\$1 != pwd {print \$1}' | xargs -I % git worktree remove %"

abbr lg lazygit
abbr ld lazydocker

abbr tlvim "NVIM_APPNAME=nvim-tlv nvim"
abbr gl 'lazygit log'
abbr gs "git status"
abbr gb "git checkout -b"
abbr gm "git branch -l main | rg main > /dev/null 2>&1 && git checkout main || git checkout master"
abbr gP "git push"
abbr gp "git pull"
alias tn "npx --no-install ts-node --transpile-only"
abbr tt "tn src/tt.ts"

# Other
abbr df "grc /bin/df -h"
abbr ntop "ultra --monitor"
abbr ytop btm
abbr gotop btm
abbr fda "fd -IH"
abbr rga "rg -uu"
abbr grep rg
abbr suod sudo
abbr helpme "bat ~/HELP.md"
abbr weather "curl -s wttr.in/Ghent | grep -v Follow"
abbr show-cursor "tput cnorm"
abbr hide-cursor "tput civis"
abbr aria2c-daemon "aria2c -D"
alias gnome-control-center "env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

# systemctl
abbr s systemctl
abbr su "systemctl --user"
abbr ss "command systemctl status"
abbr sl "systemctl --type service --state running"
abbr slu "systemctl --user --type service --state running"
abbr se "sudo systemctl enable --now"
abbr sd "sudo systemctl disable --now"
abbr sr "sudo systemctl restart"
abbr so "sudo systemctl stop"
abbr sa "sudo systemctl start"
abbr sf "systemctl --failed --all"

# journalctl
abbr jb "journalctl -b"
abbr jf "journalctl --follow"
abbr jg "journalctl -b --grep"
abbr ju "journalctl --unit"
abbr reload "source ~/.config/fish/config.fish"

function send_to
    if set -q chosen_file
        if test (count $argv) -eq 0
            echo "Error: No remote host provided"
            return 1
        end

        set remote_host $argv[1]
        echo "Sending $chosen_file to $remote_host"
        read -P "Are you sure you want to send this file? [y/N] " -l -n 1 confirmation
        if test "$confirmation" = "y" -o "$confirmation" = "Y"
            if string match -q "*laptop*" $remote_host
                rsync -avhe 'ssh' $chosen_file $remote_host:~/Downloads/workstation/
            else
                rsync -avhe 'ssh' $chosen_file $remote_host:/home/root/
            end
        else
            echo "Operation canceled"
        end
    else
        echo "No file selected"
    end
end
abbr devup "devcontainer up --workspace-folder ./"

function node
    load_nvm > /dev/stderr
    bass node $argv
end

function npm
    load_nvm > /dev/stderr
    bass npm $argv
end

function npx
    load_nvm > /dev/stderr
    bass npx $argv
end

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
