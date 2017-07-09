# =====================================================================================================================
# ZSH ruby and git centric prompt
# Made by Martin T.
# =====================================================================================================================

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# rbenv info
local node_info=' (%{$fg[red]%}node-$(node -v)%{$reset_color%})'

# VCS
YS_VCS_PROMPT_PREFIX1=" "
YS_VCS_PROMPT_PREFIX2="%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}✖︎"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}●"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Prompt
PROMPT="%{$fg[green]%}${current_dir}%{$reset_color%}\
${node_info}\
${git_info} \
%{→ %{$reset_color%}"

