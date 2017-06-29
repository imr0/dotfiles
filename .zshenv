export EDITOR=nvim
export TERM=xterm-256color
export PATH=/home/imre/bin:$PATH

# The pointer chose a terrible default color
export FZF_TMUX=1
export FZF_DEFAULT_OPTS='--color pointer:168'
_fzf_compgen_path() {
  ag -g "" "$1"
}

# OpenMP Stacksize for NNLOJET
export OMP_STACKSIZE=999999
