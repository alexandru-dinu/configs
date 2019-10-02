function conda_current_env () {
    if [[ -v CONDA_DEFAULT_ENV ]]; then
        echo "${ZSH_THEME_CONDA_PROMPT_PREFIX}${ZSH_THEME_CONDA_PROMPT_CUSTOM}${CONDA_DEFAULT_ENV}${ZSH_THEME_CONDA_PROMPT_SUFFIX}"
    fi
}
