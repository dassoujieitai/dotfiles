# export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
# if which ebenv > /dev/null; then eval "$(rbenv init -)"; fi
# export CC=/usr/bin/gcc
autoload -U compinit
compinit
setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars

PROMPT="%n@%m:%~ %% "

alias ls="/usr/local/bin/gls -F --color=auto"

source $(brew --prefix nvm)/nvm.sh
export NVM_DIR=~/.nvm

# for byobu
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/

# Ruby gems for 2.1.1
# export GEM_HOME=${HOME}/lib/gems/2.1.1

# export PATH=${GEM_HOME}/bin:${PATH}

# for rbenv
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

# for byobu
export BYOBU_PREFIX=$(brew --prefix)

# for zsh-syntax-highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

