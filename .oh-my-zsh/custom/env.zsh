 export GOPATH="$HOME/go"
 export GOBIN="$GOPATH/bin"
 export GOSRC="$GOPATH/src"
 export GOGITHUB="$GOSRC/github.com"
 export GOARUSH="$GOGITHUB/arush-sal"
 export GO111MODULE=on
 export PATH="/usr/lib/wsl/lib:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA App/NvDLISR:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/ProgramData/chocolatey/bin:/Docker/host/bin:/mnt/c/Users/micro/scoop/apps/gpg/current/bin:/mnt/c/Users/micro/scoop/shims:/mnt/c/Users/micro/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/micro/AppData/Local/Programs/Microsoft VS Code/bin:/home/salil/.fzf/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$GOBIN:$HOME/.local/bin:${KREW_ROOT-$HOME/.krew}/bin"
 export MAIL=/var/mail/arush
 export MAILCHECK=3600
 export GPG_TTY=$(tty)
 [ -f ~/.cargo/env ] && source "~/.cargo/env"
 [ -f ~/.oh-my-zsh/custom/private.zsh ] && source ~/.oh-my-zsh/custom/private.zsh
 hash kops &> /dev/null && source <(kops completion zsh)
 hash argocd &> /dev/null && source <(argocd completion zsh)
 hash /usr/local/bin &> /dev/null && source <(bin completion zsh)
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
 export PYENV_ROOT="$HOME/.pyenv"
 [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
 eval "$(pyenv init - --detect-shell)"
 eval "$(pyenv virtualenv-init -)"
 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

