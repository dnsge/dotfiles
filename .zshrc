##
## Uses oh-my-zsh: https://github.com/ohmyzsh/ohmyzsh
## 
## List of tools:
## - bat: https://github.com/sharkdp/bat
## - delta: https://github.com/dandavison/delta
## - eza: https://github.com/eza-community/eza
## - zoxide: https://github.com/ajeetdsouza/zoxide

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="clear"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git docker macos sudo colored-man-pages)

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

# requires exa: https://github.com/ogham/exa
alias ls="eza --icons" 
alias l="eza -l --icons"
alias la="eza -la --icons"

# make `diff` use full terminal width
alias diff='diff -W $(tput cols)'

# git
alias gpom='git push origin master'
alias gg='git grep -nr'
alias ggi='git grep -nri'
alias git-fix='git commit --fixup HEAD && git -c sequence.editor=: rebase -i --autostash --autosquash HEAD~2'

# navigation
alias cdback='cd $OLDPWD'
alias see='open -R'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# zsh
alias zshreload="exec zsh"
alias zshconfig="vim ~/.zshrc"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

############################
## Load .local zsh config ##
############################

source "$HOME/.zshrc.local"

