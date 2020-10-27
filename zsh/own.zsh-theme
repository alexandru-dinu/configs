local ret_status="%(?:%{$fg_bold[cyan]%}» :%{$fg_bold[red]%}» )%{$reset_color%}"
local ret_code="%(?:%{$fg[cyan]%}%?:%{$fg[red]%}%?)%{$reset_color%}"

local s1="%{$fg[cyan]%}╭─%{$reset_color%}"
local s2="%{$fg[cyan]%}╰─%{$reset_color%}"

local full_path="%{$fg[cyan]%}%3~%{$reset_color%}"

PROMPT='${s1} ${ret_code} ${full_path}$(git_branch_info)$(conda_current_env)$(ssh_show_host)
${s2} ${ret_status}'

local left_indicator="‹"
local right_indicator="›"

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}${left_indicator}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}${left_indicator}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${right_indicator}%{$reset_color%}"

ZSH_THEME_CONDA_PROMPT_PREFIX=" "
ZSH_THEME_CONDA_PROMPT_CUSTOM="%{$fg[magenta]%}${left_indicator}"
ZSH_THEME_CONDA_PROMPT_SUFFIX="${right_indicator}%{$reset_color%}"

ZSH_THEME_SSH_PROMPT_PREFIX=" "
ZSH_THEME_SSH_PROMPT_CUSTOM="%{$fg_bold[green]%}${left_indicator}"
ZSH_THEME_SSH_PROMPT_SUFFIX="${right_indicator}%{$reset_color%}"
