local ret_status="%(?:%{$fg_bold[cyan]%}» :%{$fg_bold[red]%}» )%{$reset_color%}"
local ret_code="%(?:%{$fg[cyan]%}%?:%{$fg[red]%}%?)%{$reset_color%}"

local s1="%{$fg[cyan]%}╭─%{$reset_color%}"
local s2="%{$fg[cyan]%}╰─%{$reset_color%}"

local full_path="%{$fg[cyan]%}%~%{$reset_color%}"

PROMPT='${s1} ${ret_code} ${full_path}$(custom_git_info)$(conda_current_env)
${s2} ${ret_status}'


ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_CONDA_PROMPT_PREFIX=" "
ZSH_THEME_CONDA_PROMPT_CUSTOM="%{$fg[green]%}"
ZSH_THEME_CONDA_PROMPT_SUFFIX="%{$reset_color%}"
