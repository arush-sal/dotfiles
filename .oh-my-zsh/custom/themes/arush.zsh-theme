local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[blue]%}%~%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FX[bold]$FG[021]%})%{$FG[001]%} ✗✗✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%})%{$FG[046]%} ✔ ✔ ✔"
