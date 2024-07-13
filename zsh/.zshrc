# ----------------------------------------------------------------------------
#  source sth
# ----------------------------------------------------------------------------
export DISABLE_AUTO_UPDATE="true"
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
    # zgen oh-my-zsh themes/robbyrussell
    zgen oh-my-zsh themes/daily

    # save all to init script
    zgen save
fi

# ----------------------------------------------------------------------------
#  alias stuff
# ----------------------------------------------------------------------------

alias setproxy="ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"

alias vi="/usr/bin/nvim"
alias vim="/usr/bin/nvim"

alias cv="/usr/bin/ydcv"
alias pc="/usr/bin/proxychains4"

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
#  zsh_history size
# ----------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=2147483647
SAVEHIST=$HISTSIZE

# ----------------------------------------------------------------------------
#  miniconda
# ----------------------------------------------------------------------------
source /opt/miniconda/etc/profile.d/conda.sh
