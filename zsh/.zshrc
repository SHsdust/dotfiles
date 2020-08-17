export ZSH="/home/emrys/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    extract
    zsh-syntax-highlighting
    autojump
    zsh-autosuggestions
)


alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"

alias vi="/usr/bin/nvim"
alias vim="/usr/bin/nvim"

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

source $ZSH/oh-my-zsh.sh

source ~/.zshenv
