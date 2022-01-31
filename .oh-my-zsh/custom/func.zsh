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

_systemctl_unit_state() {
  typeset -gA _sys_unit_state
  _sys_unit_state=( $(__systemctl list-unit-files "$PREFIX*" | awk '{print $1, $2}') )
}

watch_k8s_resource() {
	watch "kubectl get $@"
}

k8s_getSecretValue() {
	echo "Namespace: "
	readline ns
	echo "Secret: "
	readline secret
	echo "Field: "
	readline field
	echo "Value: "
	kubectl get secret --namespace $ns $secret -o jsonpath="{.data.$field}" | base64 --decode
}

safari-dl() {
	if [ -e $HOME/Downloads/oreilly.com_cookies.txt ]; then
		youtube-dl --cookies $HOME/Downloads/oreilly.com_cookies.txt \
			--convert-subs srt --embed-sub --ignore-errors --keep-video \
			--username sushantsalil@acm.org --write-sub --sub-lang en \
			--output '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' $@
	fi
}

gh-cloc() {
  git clone --depth 1 "$1" temp-linecount-repo &&
  printf "('temp-linecount-repo' will be deleted automatically)\n\n\n" &&
  cloc temp-linecount-repo &&
  rm -rf temp-linecount-repo
}
