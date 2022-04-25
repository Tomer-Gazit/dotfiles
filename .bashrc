# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Source .bash_aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# User specific aliases and functions
# cd into dir on name mention
shopt -s autocd

# Always create parent directories and give output on mkdir
alias mkdir="mkdir -pv"

# ls only dotfiles
function lh() {
	[ -z $1 ] && ls -dF .* || ls -dF "$1"/.*
}
