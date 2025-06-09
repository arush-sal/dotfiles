local ret_host="%(?:%{$FX[bold]%}%M:%{$FX[bold]$FG[196]%}%M)"
PROMPT='${ret_host} %{$fg[blue]%}%~%{$reset_color%} $(custom_git_prompt_info)'

DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$FG[001]%} ✗✗✗"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[blue]%})%{$FG[003]%} +++"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%})%{$FX[bold]$FG[046]%} 🗸🗸🗸"

ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{$reset_color%}%{$fg_bold[black]%}↓"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="%{$reset_color%}%{$fg_bold[white]%}↑"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_BRANCH_COLOR="%{$fg_bold[red]%}"
