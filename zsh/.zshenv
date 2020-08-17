# export PATH=$PATH:$HOME/.pyenv/bin:$HOME/.local/bin:$HOME/.pyenv/bin

# export PATH=$HOME/.pyenv/plugins/pyenv-virtualenv/shims:$HOME/.pyenv/shims:/usr/local/sbin:/usr/local/bin:/usr/bin:$HOME/.pyenv/bin:$HOME/.local/bin:$HOME/.pyenv/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.pyenv/bin:$HOME/.local/bin:$HOME/.pyenv/bin


typeset -U path
path=($HOME/.pyenv/plugins/pyenv-virtualenv/shims $HOME/.pyenv/shims /usr/local/sbin /usr/local/bin /usr/bin $HOME/.pyenv/bin $HOME/.local/bin $HOME/.pyenv/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl $HOME/.pyenv/bin $HOME/.local/bin $HOME/.pyenv/bin)
export PATH
