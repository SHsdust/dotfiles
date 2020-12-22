# ----------------------------------------------------------------------------
#  source sth
# ----------------------------------------------------------------------------
source ~/.zshenv
source "${HOME}/.zgen/zgen.zsh"

# ----------------------------------------------------------------------------
#  zgen config
# ----------------------------------------------------------------------------
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/extract
    zgen oh-my-zsh plugins/autojump

    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-syntax-highlighting

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/robbyrussell

    # save all to init script
    zgen save
fi

# ----------------------------------------------------------------------------
#  alias stuff
# ----------------------------------------------------------------------------

alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"

alias vi="/usr/bin/nvim"
alias vim="/usr/bin/nvim"

alias cv="/usr/bin/ydcv"
alias pc="/usr/bin/proxychains4"

# ----------------------------------------------------------------------------
#  pyenv config
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
