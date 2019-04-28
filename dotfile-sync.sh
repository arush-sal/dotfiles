#!/bin/bash

DOTDIR="$HOME/Documents/dotfiles"
LOGFILE="$HOME/dotsync.log"
DASHLINE='-----------------------------'
echo -e "\n""$DASHLINE$(date)$DASHLINE""\n" >> $LOGFILE
checkdiff() {
	if [[ ! -e $2 ]]; then
		cp -vrf $1 $2 >> $LOGFILE
	fi
	if ! diff $1 $2 &> /dev/null; then
		notify-send "Sync for $1 started..."
		echo >> $LOGFILE
		echo -e "\t\t$1 has been modified" >> $LOGFILE
		echo "$DASHLINE DIFF START $DASHLINE" >> $LOGFILE
		echo `diff $1 $2` >> $LOGFILE
		echo "$DASHLINE DIFF END $DASHLINE" >> $LOGFILE
		echo >> $LOGFILE

		#Update repo
		cp -vrf $1 $2 >> $LOGFILE
	fi
}

##Files
# Sync .zshrc
checkdiff ~/.zshrc $DOTDIR/.zshrc
# Sync .tmux
checkdiff ~/.tmux.conf.local $DOTDIR/.tmux.conf.local 
checkdiff ~/.tmux/.tmux.conf $DOTDIR/.tmux/.tmux.conf
# Sync .vimrc
checkdiff ~/.vimrc $DOTDIR/.vimrc
# Sync oh-my-zsh
checkdiff ~/.oh-my-zsh/custom/themes/arush.zsh-theme $DOTDIR/.oh-my-zsh/custom/themes/arush.zsh-theme
checkdiff ~/.oh-my-zsh/custom/alias.zsh $DOTDIR/.oh-my-zsh/custom/alias.zsh
checkdiff ~/.oh-my-zsh/custom/env.zsh $DOTDIR/.oh-my-zsh/custom/env.zsh
checkdiff ~/.oh-my-zsh/custom/tmux-ubuntu.zsh $DOTDIR/.oh-my-zsh/custom/tmux-ubuntu.zsh
checkdiff ~/.oh-my-zsh/custom/tmux-minikube.zsh $DOTDIR/.oh-my-zsh/custom/tmux-minikube.zsh
# Sync i3
checkdiff ~/.config/i3/config $DOTDIR/i3/config
checkdiff ~/.config/i3/status.conf $DOTDIR/i3/status.conf
# Sync slim
checkdiff /etc/slim.conf $DOTDIR/slim/slim.conf
checkdiff /usr/share/slim/themes/debian-lines/slim.theme $DOTDIR/slim/slim-theme/slim.theme

cd $DOTDIR;
if [[ -n $(git status -s) ]]; then
	git status
	echo $DASHLINE
	git add .
	git commit -s -a -m "Sync recent changes"
fi
