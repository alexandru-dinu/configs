if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi
if [ $UID -eq 0 ]; then UAH="red"; else UAH="green"; fi

NEWLINE=$'\n'

# make the prompt arrow red for non-zero return codes
local return_code="%(?.%{${fg[cyan]}%}».%{$fg[red]%}»%{$reset_color%})"

PROMPT='\
$fg[white][$fg[white]%*$fg[white]]%{$reset_color%} \
%{$fg[$UAH]%}%n@%m%{$reset_color%} \
%{${fg_bold[blue]}%}:: %{$reset_color%}\
%{${fg[cyan]}%}%3~ \
$(my_git_current_branch) \
${NEWLINE}\
${return_code} \
%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
