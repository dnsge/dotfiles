# dotfiles

My dotfiles

## Set up dotfiles in `$HOME`

```
# Clone repository
git clone --bare git@github.com:dnsge/dotfiles.git ~/.dotfiles

# Alias for configuring repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Ignore untracked files
dotfiles config --local status.showUntrackedFiles no
```

Based on setup from https://www.atlassian.com/git/tutorials/dotfiles
