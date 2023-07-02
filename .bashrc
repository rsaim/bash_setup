source ~/.git-prompt.sh

export HOMEBREW_NO_AUTO_UPDATE=1

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\n> \[\]\[\033[38;5;51m\]\u\[\]\[\033[38;5;15m\] \[\]\[\033[38;5;11m\]@ $(hostname)\[\]\[\033[38;5;15m\] \[\]\[\033[38;5;10m\]\w\[\]\[\033[38;5;15m\]\[\]\[\033[38;5;141m\]\$(parse_git_branch) \[\033[00m\]\t\[\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;13m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\] "
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# bash alias
source ~/.bash_alias

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
HISTCONTROL=erasedups
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# <TAB> completions
completions () (
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi

    IFS="$COMP_WORDBREAKS" read -a words <<<"$1"
    complete_setting=($(complete -p "${words[0]}"))
    complete_optstring=":abcdefgjksuvprDEo:A:G:W:F:C:X:P:S:"
    while getopts "$complete_optstring" option "${complete_setting[@]:1}"
    do
        case $option in
            F) complete_functon="$OPTARG"
                ;;
            *) # Run around screaming!
                ;;
        esac
    done
    COMP_WORDS=("${words[@]}")
    COMP_LINE="$1"
    COMP_POINT="${#COMP_LINE}"
    COMP_CWORD=$((${#COMP_WORDS[@]} - 1))
    "$complete_functon"
    printf "%s\n" "${COMPREPLY[@]}"
)

export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'

if [ ! -f ~/.bash_eternal_history ]; then
    ln -s ~/.bash_history ~/.bash_eternal_history
fi
