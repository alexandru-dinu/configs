if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi
if [ $UID -eq 0 ]; then UAH="red"; else UAH="green"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# PROMPT='%{$fg[$UAH]%}%n@%m%{$reset_color%} %{${fg_bold[blue]}%}:: %{$reset_color%}%{${fg[cyan]}%}%3~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '
PROMPT='%{$fg[$UAH]%}%n@%m%{$reset_color%} %{${fg_bold[blue]}%}:: %{$reset_color%}%{${fg[cyan]}%}%3~ »%{${reset_color}%} '

# add a horizontal bar and return code
PROMPT='%(?.%F{green}.%F{red})%U${(l:COLUMNS:: :)?}%u'$PROMPT
zle_highlight=(default:fg=white)

# RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
