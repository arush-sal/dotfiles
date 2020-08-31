#git remote add upstream https://github.com/whoever/whatever.git

# Fetch all the branches of that remote into remote-tracking branches,
# # such as upstream/master:
#
# git fetch upstream
#
# # Make sure that you're on your master branch:
#
# git checkout master
#
# # Rewrite your master branch so that any commits of yours that
# # aren't already in upstream/master are replayed on top of that
# # other branch:
#
# git rebase upstream/master

minikube-restart() {
	minikube stop $@;
	minikube start $@;
}

goclone(){
	floc=$(echo "$@" | grep -o -E 'github.com[:/].+')
	floc=$(echo $floc | sed -r 's|:|/|g' | cut -d'.' -f-2)
	echo $floc
	git clone $@ $GOSRC/$floc
}

ggocd(){
	dir=$(find $GOSRC -maxdepth 3 -iname $1 -type d)
	cd $dir
}

kind_update() {
	download_url=$(curl -s https://api.github.com/repos/kubernetes-sigs/kind/releases/latest | jq -r '.assets[].browser_download_url' | grep "linux-amd64")
	download_location=/tmp/kind
	bin_location=$(which kind)
	echo "\nDownloading kind in /tmp\n"
	wget -q --show-progress -c -O $download_location $download_url
	sudo mv $download_location $bin_location
	sudo chmod +x $bin_location
}

kubectl_update() {
	curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	chmod +x ./kubectl
	sudo mv ./kubectl /usr/local/bin/kubectl
}

_systemctl_unit_state() {
  typeset -gA _sys_unit_state
  _sys_unit_state=( $(__systemctl list-unit-files "$PREFIX*" | awk '{print $1, $2}') )
}
