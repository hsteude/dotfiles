# Conda Info
local conda_info='$(conda_prompt_info)'
conda_prompt_info() {
  if [ -n "$CONDA_DEFAULT_ENV" ]; then
    echo -n "%{$fg[green][$CONDA_DEFAULT_ENV]%{$reset_color%} "
  else 
    echo -n "%{$fg[green][base]%{$reset_color%} "
  fi
}
#
# PROMPT
#
PROMPT_BRACKET_BEGIN=''
PROMPT_HOST='%{$fg_bold[cyan]%}%m'
PROMPT_SEPARATOR='%{$reset_color%}:'
PROMPT_DIR='%{$fg_bold[yellow]%}%c'
PROMPT_BRACKET_END=''

PROMPT_USER='%{$fg_bold[white]%}%n'
PROMPT_SIGN=' $ '

GIT_PROMPT_INFO='$(git_prompt_info)'
CONDA_INFO=' $(conda_prompt_info)'

# My current prompt looks like:
PROMPT="${CONDA_INFO}${PROMPT_USER}@${PROMPT_BRACKET_BEGIN}${PROMPT_HOST}${PROMPT_SEPARATOR}${PROMPT_DIR}${PROMPT_BRACKET_END}${GIT_PROMPT_INFO}${PROMPT_SIGN}"
#
# Git repository
#
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=''
