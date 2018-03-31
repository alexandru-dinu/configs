if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi
if [ $UID -eq 0 ]; then UAH="red"; else UAH="green"; fi

# make the prompt arrow red for non-zero return codes
local return_code="%(?.%{${fg[cyan]}%}».%{$fg[red]%}»%{$reset_color%})"

PROMPT='\
%{$fg[$UAH]%}%n@%m%{$reset_color%} \
%{${fg_bold[blue]}%}:: %{$reset_color%}\
%{${fg[cyan]}%}%3~ \
${return_code}\
%{$reset_color%} '
