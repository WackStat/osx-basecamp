source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux.disable
unbind-key -n C-a
set -g prefix ^A 
set -g prefix2 ^A
bind a send-prefix
