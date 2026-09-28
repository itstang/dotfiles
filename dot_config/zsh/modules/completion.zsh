fpath=(
  /opt/homebrew/share/zsh/site-functions
  /opt/homebrew/share/zsh-completions
  $fpath
)

[[ -d $XDG_CACHE_HOME/zsh ]] || mkdir -p $XDG_CACHE_HOME/zsh
_zcd=$XDG_CACHE_HOME/zsh/zcompdump

autoload -Uz compinit
_zstale=( $_zcd(N.mh+24) )
if (( $#_zstale )) || [[ ! -s $_zcd ]]; then
  compinit -d $_zcd
  touch $_zcd
else
  compinit -C -d $_zcd
fi
unset _zstale

if [[ ! -s $_zcd.zwc || $_zcd -nt $_zcd.zwc ]]; then
  zcompile -R -- $_zcd.zwc $_zcd
fi
unset _zcd

zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':fzf-tab:*' fzf-flags --style=full --preview-window=right:50%
zstyle ':fzf-tab:*' fzf-min-height 30
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --level=2 --icons --color=always $realpath'
zstyle ':fzf-tab:complete:(nvim|bat|cat|less):*' fzf-preview 'bat --color=always --style=numbers $realpath'
