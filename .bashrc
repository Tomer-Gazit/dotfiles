# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Source .bash_aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases \
                        && echo "~/.bash_aliases LOADED" \
                        || echo "~/.bash_aliases NOT FOUND"

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

# Auto add commit & push repo to git
function gitACP() {
  if [ -z "$1" ]; then
    echo "Please provide path to repository"
  else
  # Proceed
    # When a commit message is not provided, use a timestamp for it
    [ -z "$2" ] &&
      commitMessage=$(TZ=":Israel" date +"Auto commit @ %T | %a %d/%m/%y") ||
      commitMessage="$2"
    git -C $1 add --all &&
    git -C $1 commit -m "${commitMessage}" &&
    git -C $1 push &&
    echo "Pushed '$1' successfully" || echo "ACP failed"
  fi
}
