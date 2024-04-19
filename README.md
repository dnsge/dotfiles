# dotfiles

My dotfiles. Configuration system based on https://dr563105.github.io/blog/manage-dotfiles-with-gnu-stow/

## Set up dotfiles in `$HOME`

First, install the `stow` tool.

```
# Clone repository
git clone https://github.com/dnsge/dotfiles.git ~/dotfiles
cd dotfiles

# Create symlinks
./ctl.sh init
```

