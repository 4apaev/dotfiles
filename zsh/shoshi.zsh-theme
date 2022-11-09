ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✚"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ✖"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[166]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[160]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[220]%}›%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[190]%}❞%{$reset_color%}"

################################################################################################################################

PROMPT="%{$fg[yellow]%}[%T] %{$reset_color%}%{$fg[green]%}%~\$(git_prompt_info)%{$reset_color%} "
