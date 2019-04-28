alias container_clean='docker rm $(docker ps -a -q)'
alias compose="$HOME/.local/bin/docker-compose"
alias container_kill='docker kill $(docker ps -a -q)'
alias git-fork-update='git fetch upstream && git checkout master && git rebase upstream/master && git push origin master'
alias minikube-update='sudo curl -Lo /usr/local/bin/minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
&& sudo chmod +x /usr/local/bin/minikube'
alias gnome-control-center='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
alias gdrive='docker run -v /home/salil/Videos/:/root -it arush/gdrive sh'
