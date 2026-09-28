export FZF_DEFAULT_OPTS="
    --style full
    --layout reverse
    --height 40%
    --color 'bg+:#252525'
    --color 'hl:#ea83a5,hl+:#ea83a5'
    --color 'info:#e6b99d'
    --color 'marker:#ea83a5'
    --color 'pointer:#ea83a5'
    --color 'border:#aca1cf'
"
export FZF_CTRL_R_OPTS="
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --color 'header:italic,header:#ffffff'
    --header 'Press CTRL-Y to copy command into clipboard'
"
export FZF_CTRL_T_OPTS="
    --preview 'fzf-preview.sh {}'
"
# must come before fzf-tab so fzf-tab's Tab binding wins
source <(fzf --zsh)

ANTIDOTE_HOME=$XDG_CACHE_HOME/antidote
zstyle ':antidote:static' file $XDG_CACHE_HOME/zsh/plugins.zsh
zstyle ':antidote:*' zcompile 'yes'
source $XDG_DATA_HOME/antidote/antidote.zsh
antidote load
