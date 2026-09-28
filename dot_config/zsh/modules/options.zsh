[[ -d $XDG_STATE_HOME/zsh ]] || mkdir -p $XDG_STATE_HOME/zsh
HISTFILE=$XDG_STATE_HOME/zsh/history
HISTSIZE=50000
SAVEHIST=50000
setopt extended_history hist_ignore_all_dups hist_save_no_dups \
       hist_ignore_space hist_verify share_history
