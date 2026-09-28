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

ZGEN_DIR=$XDG_DATA_HOME/zgenom
ZGEN_AUTOLOAD_COMPINIT=0
source $ZGEN_DIR/zgenom.zsh
zgenom autoupdate

if ! zgenom saved; then
  zgenom load aloxaf/fzf-tab
  zgenom load zdharma-continuum/fast-syntax-highlighting
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load akash329d/zsh-alias-finder
  zgenom save
  zgenom compile $ZDOTDIR
fi
