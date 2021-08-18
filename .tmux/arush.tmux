# : << EOF
# Redefine tmux status bar separators
tmux_conf_theme_left_separator_main='\uE0B0'  # '' # /!\ you don't need to install Powerline
tmux_conf_theme_left_separator_sub='\uE0B1'   # '' #   you only need fonts patched with
tmux_conf_theme_right_separator_main='\uE0B2' # '' #   Powerline symbols or the standalone
tmux_conf_theme_right_separator_sub='\uE0B3'  # '' #   PowerlineSymbols.otf font, see README.md

# Redefine windows name to add Zoom attribute
tmux_conf_theme_window_status_current_format="#{?window_flags,#{window_flags},}"

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
#set -g @plugin 'tmux-plugins/tmux-resurrect'
#set -g @plugin 'tmux-plugins/tmux-continuum'
#set -g @continuum-restore 'on'

#Enable mouse support
set -g mouse on

# Bind shortcut to our function
bind m run "cut -c3- ~/.tmux/arush.tmux | sh -s _toggle_mouse"

# Unbind C-l to clear history
unbind -n C-l

# Set copy buffer copy to OS clipboard true
tmux_conf_copy_to_os_clipboard=true

# Redfine the _toggle_mouse function to have a display message
# EOF
#
# _toggle_mouse() {
#   old=$(tmux show -gv mouse)
#   new=""
#
#   if [ "$old" = "on" ]; then
#     new="off"
#   else
#     new="on"
#   fi
#
#   tmux set -g mouse $new \;\
#    display "mouse: $new"
# }
#
# "$@"

# __apply_plugins() {
#   window_active="$1"
#   tmux_conf_update_plugins_on_launch="$2"
#   tmux_conf_update_plugins_on_reload="$3"
#
#   if public-ip > /dev/null; then
#      TMUX_PLUGIN_MANAGER_PATH=${TMUX_PLUGIN_MANAGER_PATH:-~/.tmux/plugins}
#      if [ ! -d "$TMUX_PLUGIN_MANAGER_PATH/tpm" ]; then
#        install_tpm=true
#        tmux display 'Installing tpm and plugins...'
#        git clone --depth 1 https://github.com/tmux-plugins/tpm "$TMUX_PLUGIN_MANAGER_PATH/tpm"
#      elif { [ -z "$window_active" ] && _is_enabled "$tmux_conf_update_plugins_on_launch"; } || { [ -n "$window_active" ] && _is_enabled "$tmux_conf_update_plugins_on_reload"; }; then
#        update_tpm=true
#        tmux display 'Updating tpm and plugins...'
#        (cd "$TMUX_PLUGIN_MANAGER_PATH/tpm" && git checkout -q master && git reset -q --hard HEAD && git pull -q origin master)
#      fi
#      if [ x"$install_tpm" = x"true" ] || [ x"$update_tpm" = x"true" ]; then
#        perl -0777 -p -i -e 's/git clone --recursive/git clone --recursive --depth 1 --shallow-submodules/g
#                            ;s/(install_plugin "\$plugin")\n(\s+)done/\1&\n\2done\n\2wait/g' "$TMUX_PLUGIN_MANAGER_PATH/tpm/scripts/install_plugins.sh"
#        perl -p -i -e 's/git submodule update --init --recursive/git submodule update --init --recursive --depth 1/g' "$TMUX_PLUGIN_MANAGER_PATH/tpm/scripts/update_plugin.sh"
#        tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH "$TMUX_PLUGIN_MANAGER_PATH"
#      fi
#      if [ x"$update_tpm" = x"true" ]; then
#        "$TMUX_PLUGIN_MANAGER_PATH/tpm/bin/update_plugins" all >/dev/null 2>&1
#        tmux display 'Done updating tpm and plugins...'
#      elif [ x"$install_tpm" = x"true" ]; then
#        "$TMUX_PLUGIN_MANAGER_PATH/tpm/bin/install_plugins" >/dev/null 2>&1
#        tmux display 'Done installing tpm and plugins...'
#      fi
#      "$TMUX_PLUGIN_MANAGER_PATH/tpm/tpm"
#      if [ -z "$window_active" ] && [ $_tmux_version -lt 240 ]; then
#        tmux run -b "sleep $(expr $(tmux display -p '#{display-time}') / 500) && tmux set display-time 3000 \; display 'This configuration will soon require tmux 2.4+' \; set -u display-time"
#      fi
#   fi
# }