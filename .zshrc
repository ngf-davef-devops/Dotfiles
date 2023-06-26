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
export PATH="/Users/fishd/.pyenv/bin:$PATH:/Users/fishd/Library/TinyTeX/bin/universal-darwin"

# Bash-style time output.
export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

# stuff.
if [ -f ~/.zsh/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh ]
then
  AGKOZAK_BLANK_LINES=1
  AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
  AGKOZAK_PROMPT_DIRTRIM=2
  AGKOZAK_USER_HOST_DISPLAY=1
  AGKOZAK_MULTILINE=0
  AGKOZAK_COLORS_USER_HOST=cyan
  AGKOZAK_COLORS_PATH=green
  source ~/.zsh/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh
else
  # Nicer prompt.
  export PS1=$'\n'"%F{cyan} %*%F %F{green}%2~ %F{white}$ "
fi

# Allow history search via up/down keys.
if [ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]
then
  source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
fi

if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh  ]
then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi


# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY          # write the history file in the ":start:elapsed;command" format.
setopt HIST_REDUCE_BLANKS        # remove superfluous blanks before recording entry.
setopt SHARE_HISTORY             # share history between all sessions.
setopt HIST_IGNORE_ALL_DUPS      # delete old recorded entry if new entry is a duplicate.

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

# Python fix for Ansible
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Grab Ansible Vault password file
export ANSIBLE_VAULT_PASSWORD_FILE=/etc/ansible/.vaultpassword

# Delete a given line number in the known_hosts file.
knownrm() {
 re='^[0-9]+$'
 if ! [[ $1 =~ $re ]] ; then
   echo "error: line number missing" >&2;
 else
   sed -i '' "$1d" ~/.ssh/known_hosts
 fi
}
if which pyenv >/dev/null; then
  eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init >/dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# Function for pandoc
alias md2word=md2word
function md2word () {
    PANDOC_INSTALLED=$(pandoc --version >> /dev/null; echo $?)

    if [ "0" == ${PANDOC_INSTALLED} ]; then
        pandoc -o $2 -f markdown -t docx $1
    else
        echo "Pandoc is not installed. Unable to convert document."
    fi
}
alias md2pdf=md2pdf
function md2pdf () {
    PANDOC_INSTALLED=$(pandoc --version >> /dev/null; echo $?)

    if [ "0" == ${PANDOC_INSTALLED} ]; then
        pandoc -o $2 -f markdown -t pdf $1
    else
        echo "Pandoc is not installed. Unable to convert document."
    fi
}

# Include local config if present
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi