 export GOPATH="$HOME/go"
 export GOBIN="$GOPATH/bin"
 export GOSRC="$GOPATH/src"
 export GOGITHUB="$GOSRC/github.com"
 export GOARUSH="$GOGITHUB/arush-sal"
 export GO111MODULE=on
 export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$GOBIN:$HOME/.local/bin:${KREW_ROOT:-$HOME/.krew}/bin:/usr/local/bin/android-tools"
 export MAIL=/var/mail/arush
 export MAILCHECK=3600
 export GPG_TTY=$(tty)
 [ -f ~/.cargo/env ] && source "~/.cargo/env"
 [ -f ~/.oh-my-zsh/custom/private.zsh ] && source ~/.oh-my-zsh/custom/private.zsh
 hash kops &> /dev/null && source <(kops completion zsh)
 hash argocd &> /dev/null && source <(argocd completion zsh)
 if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
    export FZF_COMPLETION_TRIGGER='``'
    export FZF_COMPLETION_OPTS='--border --info=inline'
    export FZF_DEFAULT_OPTS="--extended
            --layout=reverse
            --info=inline
            --height=80%
            --multi
            --preview-window=:hidden
            --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
            --prompt='∼ ' --pointer='▶' --marker='✓'
            --bind '?:toggle-preview'
            --bind 'ctrl-a:select-all'
            --bind 'ctrl-e:execute(vim {+} >/dev/tty)'
            --bind 'ctrl-v:execute(code {+})'"
    export FZF_CTRL_R_OPTS='--sort --exact'
 fi
