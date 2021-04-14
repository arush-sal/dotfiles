# Redefine tmux status bar separators
tmux_conf_theme_left_separator_main='\uE0B0'  # '' # /!\ you don't need to install Powerline
tmux_conf_theme_left_separator_sub='\uE0B1'   # '' #   you only need fonts patched with
tmux_conf_theme_right_separator_main='\uE0B2' # '' #   Powerline symbols or the standalone
tmux_conf_theme_right_separator_sub='\uE0B3'  # '' #   PowerlineSymbols.otf font, see README.md

# Redefine tmux status bar setup
tmux_conf_theme_status_left='❐ #S'
tmux_conf_theme_status_right='#{prefix}#{pairing}#{synchronized}#(/bin/bash $HOME/.tmux/kube.tmux 252 red cyan) #{?battery_status, #{battery_status},}#{?battery_bar, #{battery_bar},}#{?battery_percentage, #{battery_percentage},}'

# Increase history size
set -g history-limit 100000

# Unbind and rebind the prefix
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# Set window movement to default
bind p previous-window
bind n next-window

# Enable TPM plugins
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @continuum-restore 'on'