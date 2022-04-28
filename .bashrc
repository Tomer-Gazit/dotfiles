# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Source .bash_aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases &&
  echo "~/.bash_aliases LOADED" || echo "~/.bash_aliases NOT FOUND"

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
    [ -z "$3" ] &&
      currenBranch=$(git -C $1 branch --show-current)
      useBranch="echo 'commiting to current branch (${currentBranch})'" ||
      useBranch="git -C $1 checkout $3" && currentBranch="$3" &&
    [ -z "${@:4}" ] &&
      addFiles="--all" ||
      addFiles="${@:4}"
    $useBranch &&
    git -C $1 add "$addFiles" &&
    git -C $1 commit -m "${commitMessage}" &&
    git -C $1 push &&
    echo "Pushed ['$addFiles'] in '$1' to ('$currentBranch') successfully" ||
    echo "ACP failed"
  fi
}

<<<<<<< Updated upstream
function testing(){
  if [ -z "$1" ]; then
    echo "'$1' not supplied"
  else
    [ -z "$2" ] &&
      commitMessage=$(TZ=":Israel" date +"Auto commit @ %T | %a %d/%m/%y") ||
        commitMessage="$2"
        echo "${commitMessage}"
        if [ -z "$3" ]; then
          echo "use master"
        else
          echo "use $3"
          [ -z "${@:4}" ] &&
              echo "\${@:4} empty. adding all" ||
              echo "lastly, ${@:4}"
        fi
  fi
}

=======
>>>>>>> Stashed changes
