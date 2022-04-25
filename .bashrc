# cd into dir on name mention
shopt -s autocd

# Always create parent directories and give output on mkdir
alias mkdir="mkdir -pv"

# ls only dotfiles
function lh() {
	[ -z $1 ] && ls -dF .* || ls -dF "$1"/.*
}
