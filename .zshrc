#
# .zshrc
#
# @author Jeff Geerling
#

# Colors.
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Don't require escaping globbing characters in zsh.
unsetopt nomatch

# Enable plugins.
plugins=(git brew history history-substring-search)

# Custom $PATH with extra locations.
export PATH=/Users/me/Library/Python/2.7/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:$PATH

# Bash-style time output.
export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

# stuff.
if [ -f ~/Documents/git/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh ]
then
  AGKOZAK_BLANK_LINES=1
  AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
  AGKOZAK_PROMPT_DIRTRIM=2
  AGKOZAK_USER_HOST_DISPLAY=1
  AGKOZAK_MULTILINE=0
  AGKOZAK_COLORS_USER_HOST=cyan
  AGKOZAK_COLORS_PATH=green
  source ~/Documents/git/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh
else
  # Nicer prompt.
  export PS1=$'\n'"%F{cyan} %*%F %F{green}%2~ %F{white}$ "
fi

# Allow history search via up/down keys.
if [ -f /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]
then
  source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  bindkey "^[[A" history-substring-search-up
  bindkey "^[[B" history-substring-search-down
fi

# Completions.
autoload -Uz compinit && compinit
# Case insensitive.
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Git upstream branch syncer.
# Usage: gsync master (checks out master, pull upstream, push origin).
function gsync() {
 if [[ ! "$1" ]] ; then
     echo "You must supply a branch."
     return 0
 fi

 BRANCHES=$(git branch --list $1)
 if [ ! "$BRANCHES" ] ; then
    echo "Branch $1 does not exist."
    return 0
 fi

 git checkout "$1" && \
 git pull upstream "$1" && \
 git push origin "$1"
}

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Delete a given line number in the known_hosts file.
knownrm() {
 re='^[0-9]+$'
 if ! [[ $1 =~ $re ]] ; then
   echo "error: line number missing" >&2;
 else
   sed -i '' "$1d" ~/.ssh/known_hosts
 fi
}
