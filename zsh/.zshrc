# ----------------------------------------------------------------------------
#  zsh theme
# ----------------------------------------------------------------------------
export ZSH="/home/emrys/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# ----------------------------------------------------------------------------
#  oh-my-zsh plugins
# ----------------------------------------------------------------------------
plugins=(
    git
    extract
    zsh-syntax-highlighting
    autojump
    zsh-autosuggestions
)

# ----------------------------------------------------------------------------
#  alias stuff
# ----------------------------------------------------------------------------

alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"

alias vi="/usr/bin/nvim"
alias vim="/usr/bin/nvim"

alias cv="/usr/bin/ydcv"

# ----------------------------------------------------------------------------
#  pyenv configure
# ----------------------------------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# for subcommand completion
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _pyenv pyenv

_pyenv() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(pyenv commands)"
  else
    completions="$(pyenv completions ${words[2,-2]})"
  fi

  reply=(${(ps:\n:)completions})
}

# ----------------------------------------------------------------------------
#  pip subcommand completion
# ----------------------------------------------------------------------------
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

# ----------------------------------------------------------------------------
#  execute sth
# ----------------------------------------------------------------------------
source $ZSH/oh-my-zsh.sh
source ~/.zshenv
