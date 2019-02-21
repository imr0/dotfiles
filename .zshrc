# History management
setopt appendhistory
setopt inc_append_history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Print error when no match
setopt nomatch

# CD behaviour
setopt autocd cdablevars

# Completion system
autoload -Uz compinit; compinit

# Initialize prompt and load theme
autoload -U promptinit; promptinit
prompt pure

# URL fix
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Globbing
setopt globdots extendedglob

# Vi mode
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1 # Shorter response


# Completion options
zstyle ':completion:*' menu select=1
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh-comp
zstyle ':completion:*' completer _expand _complete _match _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' \
    max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
setopt COMPLETE_ALIASES

# Contextual history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Freezing changes to terminal
ttyctl -f

# Remembering visited directories
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Syntax highlighting (must be sourced at end)
if [[ -a /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_STYLES[path]='bold'
fi

# Aliases
source $HOME/dotfiles/alias.sh


# FZF Settings
if [[ -a /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
fi

if [[ -a /usr/share/fzf/completion.zsh ]]; then
    source /usr/share/fzf/completion.zsh
fi
