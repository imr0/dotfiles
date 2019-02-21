# Aliases
alias ls='ls -alhF --color'
alias ll='ls -alhF --color'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if type nvim > /dev/null; then
    alias vi='nvim'
    alias vimdiff3='nvim -f -d -c "wincmd J" "$MERGED" "$LOCAL" "$BASE" "$REMOTE"'
else
    alias vi='vim'
fi
