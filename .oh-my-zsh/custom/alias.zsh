alias container_clean='docker rm $(docker ps -a -q)'
alias compose="/home/salil/go/bin/docker-compose"
alias container_kill='docker kill $(docker ps -a -q)'
alias minikube-update=' sudo curl -Lo /tmp/minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
						&& sudo mv /tmp/minikube /usr/local/bin/minikube \
						&& sudo chmod +x /usr/local/bin/minikube'
alias gnome-control-center='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
alias gdrive='docker run -v /home/salil/Videos/:/root -it arush/gdrive sh'
alias kk='kubectl krew'
alias suspend="sudo echo; sudo pm-suspend &; i3lock -c 000000"
alias deploy_helm='kubectl create serviceaccount --namespace kube-system tiller && kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller && helm init --service-account tiller'
alias ws-lot='cd $GOGITHUB/infracloudio/lot'
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
alias gpl='git pull'
alias gph='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
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

# Required to enable two finger scroll after sleep on Thinkpad E480
alias enable_finger_scroll='sudo modprobe -r psmouse; sudo modprobe psmouse'

alias whatprovides='apt-cache search'

