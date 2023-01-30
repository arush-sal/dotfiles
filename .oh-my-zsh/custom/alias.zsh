alias container_clean='docker rm $(docker ps -a -q)'
alias compose="$GOBIN/docker-compose"
alias container_kill='docker kill $(docker ps -a -q)'
alias minikube-update=' sudo curl -Lo /tmp/minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
						&& sudo mv /tmp/minikube /usr/local/bin/minikube \
						&& sudo chmod +x /usr/local/bin/minikube'
alias gnome-control-center='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
alias gdrive="docker run -v $HOME/Videos/:/root -it arush/gdrive sh"
alias kk='kubectl krew'
alias suspend="sudo echo; sudo pm-suspend &; lock-i3"
alias deploy_helm='kubectl create serviceaccount --namespace kube-system tiller && kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller && helm init --service-account tiller'
alias ws-lot="cd $GOGITHUB/arush-sal/lot"
alias gmi="GO111MODULE=on go mod init"
alias gmd="GO111MODULE=on go mod download"
alias gmt="GO111MODULE=on go mod tidy"
alias gmv="GO111MODULE=on go mod vendor"
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gclean='git clean -fd'
alias gcm='git checkout master'
alias gc='git commit -S --signoff'
alias gcmsg='git commit -m'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gch='git checkout'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
alias gpl='git pull --all'
alias gplm='git pull origin master'
alias gpld='git pull origin develop'
alias gph='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gpod='git push origin develop'
alias gpf='git push --force'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias gst='git status'
alias gshl='git stash list'
alias gshp='git stash pop'
alias gshd='git stash drop'
alias gsh='git stash'
alias git-fork-update='git fetch upstream && git checkout main && git rebase upstream/main && git push origin main'
alias ctx='kubectx'
alias kgpa="kubectl get pods --all-namespaces"

alias whatprovides='apt-cache search'
alias remoteLock='DISPLAY=:0 xdotool getactivewindow key Super+l'

alias start-gnome='startx /etc/X11/xinit/xinitrc'

alias hadoling='docker run --rm -i hadolint/hadolint < Dockerfile'
alias dockerlint='docker run -v `pwd`/Dockerfile:/Dockerfile replicated/dockerfilelint /Dockerfile'
alias asciicast2gif='docker run --rm -v $PWD:/data asciinema/asciicast2gif'
alias clear-recent="rm ~/.local/share/recently-used.xbel"

alias enable_sdcard="sudo modprobe -r rtsx_pci_sdmmc && sudo modprobe -r rtsx_pci && sudo modprobe rtsx_pci"

alias warp-it="warp-cli connect"
alias unwarp-it="warp-cli disconnect && sudo systemctl restart systemd-resolved.service"
alias rclone="rclone -P -u -vvvvv --human-readable --ignore-existing -M --delete-after"
