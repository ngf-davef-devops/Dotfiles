#
# .zshrc
#
# @author Jeff Geerling
#

# Colors.
#unset LSCOLORS
#export CLICOLOR=1
#export CLICOLOR_FORCE=1

# Don't require escaping globbing characters in zsh.
#unsetopt nomatch

# Bash-style time output.
#export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

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
  AGKOZAK_USER_HOST_DISPLAY=1
  AGKOZAK_MULTILINE=1
#  AGKOZAK_COLORS_USER_HOST=cyan
#  AGKOZAK_COLORS_PATH=green
  source ~/.zsh/agkozak-zsh-prompt/agkozak-zsh-prompt.plugin.zsh
else
  # Nicer prompt.
  export PS1=$'\n'"%F{cyan} %*%F %F{green}%2~ %F{white}$ "
fi

# Allow history search via up/down keys.
if [ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]
then
  source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
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
