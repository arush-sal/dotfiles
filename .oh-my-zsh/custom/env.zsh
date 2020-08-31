 export GOPATH="$HOME/go"
 export GOBIN="$GOPATH/bin"
 export GOSRC="$GOPATH/src"
 export GOGITHUB="$GOSRC/github.com"
 export GOARUSH="$GOGITHUB/arush-sal"
 export GO111MODULE=on
 export DOCKER_BUILDKIT=1
 export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$GOBIN:$HOME/.local/bin:${KREW_ROOT:-$HOME/.krew}/bin"
 if [ -e /home/salil/.nix-profile/etc/profile.d/nix.sh ]; then . /home/salil/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
