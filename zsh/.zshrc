##
## Uses oh-my-zsh: https://github.com/ohmyzsh/ohmyzsh
##
## List of tools:
## - bat: https://github.com/sharkdp/bat
## - delta: https://github.com/dandavison/delta
## - eza: https://github.com/eza-community/eza
## - zoxide: https://github.com/ajeetdsouza/zoxide

export PATH="/opt/homebrew/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="clear"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git docker macos sudo colored-man-pages zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

###################
## Configuration
###################

export EDITOR="vim"
# https://github.com/sharkdp/bat
export BAT_PAGER="less -R"
# https://github.com/dandavison/delta
export DELTA_PAGER="less -R"

eval "$(zoxide init zsh)"

###################
## Aliases
###################

alias ls="eza --icons"
alias l="eza -l --icons"
alias la="eza -la --icons"

# make `diff` use full terminal width
alias diff='diff -W $(tput cols)'

# git
gpom() {
  # Check if the branch is named 'master' or 'main'
  branch=$(git symbolic-ref --short HEAD)
  if [ "$branch" = "master" ] || [ "$branch" = "main" ]; then
    git push origin "$branch"
  else
    # Handle cases where you're on a different branch or if neither 'master' nor 'main' exist
    echo "Current branch is not 'main' or 'master'. Aborting push."
  fi
}
alias gg='git grep -nr'
alias ggi='git grep -nri'
alias git-fix='git commit --fixup HEAD && git -c sequence.editor=: rebase -i --autostash --autosquash HEAD~2'

# navigation
alias cdback='cd $OLDPWD'
alias see='open -R'

# kubernetes
alias k8s-show-ns="kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n"
alias k="kubectl"

# zsh
alias zshreload="exec zsh"
alias zshconfig="vim ~/.zshrc"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

if [[ `uname` == Darwin ]]; then
	alias uuidgen='uuidgen | tr A-F a-f'
fi

# Decodes a JWT header and payload from stdin
# Assumes 'jq' and 'base64' are installed
parse_jwt () {
    _decode_base64url () {
        # 1. Read input into a variable
        local input=$(cat)

        # 2. Convert Base64URL to standard Base64
        local base64_str=$(echo "$input" | tr '-' '+' | tr '_' '/')

        # 3. Add padding characters (=) if necessary
        local len=${#base64_str}
        local pad=$(( (4 - len % 4) % 4 ))

        if [ $pad -eq 1 ]; then base64_str="${base64_str}=";
        elif [ $pad -eq 2 ]; then base64_str="${base64_str}==";
        fi

        # 4. Decode and format
        echo "$base64_str" | base64 -d 2>/dev/null | jq .
    }

    read -r token
    echo "$token" | cut -d'.' -f1 | _decode_base64url
    echo "$token" | cut -d'.' -f2 | _decode_base64url
}

############################
## Load .local zsh config ##
############################

source "$HOME/.zshrc.local"

