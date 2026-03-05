#!/bin/bash

DOTDIR="$HOME/Documents/dotfiles"
LOGFILE="$HOME/dotsync.log"
NOTIFY='/usr/bin/notify-send'
DASHLINE='-----------------------------'
echo -e "\n""$DASHLINE$(date)$DASHLINE""\n" >> $LOGFILE
checkdiff() {
	if [[ ! -e $2 ]]; then
		cp -vrf $1 $2 >> $LOGFILE
	fi
	if ! diff $1 $2 &> /dev/null; then
		$NOTIFY "Sync for $1 started..."
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

function doesExist() {
	if [[ -f $1 ]]; then return 0; else return 1; fi
}

##Files
# Sync monitor-setup
doesExist "/usr/local/bin/monitor-setup.sh" && checkdiff /usr/local/bin/monitor-setup.sh $DOTDIR/monitor-setup.sh
# Sync .gitconfig
doesExist "$HOME/.gitconfig" && checkdiff $HOME/.gitconfig $DOTDIR/.gitconfig
# Sync .zshrc
doesExist "$HOME/.zshrc" && checkdiff $HOME/.zshrc $DOTDIR/.zshrc
# Sync .tmux
doesExist "$HOME/.tmux/arush.tmux" && checkdiff $HOME/.tmux/arush.tmux $DOTDIR/.tmux/arush.tmux
doesExist "$HOME/.tmux/kube.tmux" && checkdiff $HOME/.tmux/kube.tmux $DOTDIR/.tmux/kube.tmux
# Sync .vimrc
doesExist "$HOME/.vimrc" && checkdiff $HOME/.vimrc $DOTDIR/.vimrc
# Sync oh-my-zsh
doesExist "$HOME/.oh-my-zsh/custom/alias.zsh" && checkdiff $HOME/.oh-my-zsh/custom/alias.zsh $DOTDIR/.oh-my-zsh/custom/alias.zsh
doesExist "$HOME/.oh-my-zsh/custom/custom-git.zsh" && checkdiff $HOME/.oh-my-zsh/custom/custom-git.zsh $DOTDIR/.oh-my-zsh/custom/custom-git.zsh
doesExist "$HOME/.oh-my-zsh/custom/env.zsh" && checkdiff $HOME/.oh-my-zsh/custom/env.zsh $DOTDIR/.oh-my-zsh/custom/env.zsh
doesExist "$HOME/.oh-my-zsh/custom/func.zsh" && checkdiff $HOME/.oh-my-zsh/custom/func.zsh $DOTDIR/.oh-my-zsh/custom/func.zsh
doesExist "$HOME/.oh-my-zsh/custom/themes/arush.zsh-theme" && checkdiff $HOME/.oh-my-zsh/custom/themes/arush.zsh-theme $DOTDIR/.oh-my-zsh/custom/themes/arush.zsh-theme
doesExist "$HOME/.oh-my-zsh/custom/tmux-minikube.zsh" && checkdiff $HOME/.oh-my-zsh/custom/tmux-minikube.zsh $DOTDIR/.oh-my-zsh/custom/tmux-minikube.zsh
doesExist "$HOME/.oh-my-zsh/custom/tmux-ubuntu.zsh" && checkdiff $HOME/.oh-my-zsh/custom/tmux-ubuntu.zsh $DOTDIR/.oh-my-zsh/custom/tmux-ubuntu.zsh
# Sync i3
doesExist "$HOME/.config/i3/config" && checkdiff $HOME/.config/i3/config $DOTDIR/i3/config
doesExist "$HOME/.config/i3/status.conf" && checkdiff $HOME/.config/i3/status.conf $DOTDIR/i3/status.conf
doesExist "$HOME/.config/i3/matrix.rasi" && checkdiff $HOME/.config/i3/matrix.rasi $DOTDIR/i3/matrix.rasi
# Sync xinitrc
doesExist && checkdiff $HOME/.xinitrc $DOTDIR/.xinitrc

cd $DOTDIR;
if [[ -n $(git status -s) ]]; then
	git status
	echo $DASHLINE
	git add .
	git yolo
	if [[ $? -ne 0 ]]; then
		git commit -s -a -m "$(curl -s whatthecommit.com/index.txt)"
	fi
fi
