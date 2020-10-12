function conda_current_env () {
    if [[ -v CONDA_DEFAULT_ENV ]]; then
        echo "${ZSH_THEME_CONDA_PROMPT_PREFIX}${ZSH_THEME_CONDA_PROMPT_CUSTOM}conda:${CONDA_DEFAULT_ENV}${ZSH_THEME_CONDA_PROMPT_SUFFIX}"
    fi
}

function is_ssh () {
    if [[ -n $SSH_CONNECTION ]]; then
        echo "${ZSH_THEME_SSH_PROMPT_PREFIX}${ZSH_THEME_SSH_PROMPT_CUSTOM}${HOST}${ZSH_THEME_SSH_PROMPT_SUFFIX}"
    fi
}
