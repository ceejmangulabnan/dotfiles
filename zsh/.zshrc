path+=('/home/ceej/.local/bin')
export PATH
export ZSH="$HOME/.oh-my-zsh"

export DOTFILES="$HOME/dotfiles"

plugins=(
	git
	npm
	nvm
	themes
	last-working-dir
	z
	)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nvim ~/.zshrc"
alias sourcezsh="source ~/.zshrc"

export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/init-nvm.sh

# Path Variables
# export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'
export COLORTERM=truecolor


export LS_COLORS='fi=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:'
LS_COLORS+='pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32'

eval "$(starship init zsh)"
set -o vi
bindkey -v 

# pnpm
export PNPM_HOME="/home/ceej/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

if [[ -o interactive ]]; then
    fastfetch
fi

export PATH=$PATH:/home/ceej/.spicetify
