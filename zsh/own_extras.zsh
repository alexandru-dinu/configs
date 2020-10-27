function git_branch_info() {
    local ref
    if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
        ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
        ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
        echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
}

function conda_current_env () {
    if [[ -v CONDA_DEFAULT_ENV ]]; then
        echo "${ZSH_THEME_CONDA_PROMPT_PREFIX}${ZSH_THEME_CONDA_PROMPT_CUSTOM}conda:${CONDA_DEFAULT_ENV}${ZSH_THEME_CONDA_PROMPT_SUFFIX}"
    fi
}

function ssh_show_host () {
    if [[ -n $SSH_CONNECTION ]]; then
        echo "${ZSH_THEME_SSH_PROMPT_PREFIX}${ZSH_THEME_SSH_PROMPT_CUSTOM}${HOST}${ZSH_THEME_SSH_PROMPT_SUFFIX}"
    fi
}
