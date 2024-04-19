if ! command -v stow &> /dev/null; then
  echo "stow command not found"
  exit 1
fi

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 [command]"
  echo ""
  echo "COMMANDS:"
  echo "    init      Initialize the dotfiles"
  echo "    test      Test the stow process without actually modifying the filesystem"
  echo "    reinit    Uninit and initialize the dotfiles"
  echo "    adopt     Adopt the contents of conflicting existing dotfiles (not yet symlinks)"
  exit 0
fi

STOW_MODULES=(
  "alacritty"
  "git"
  "oh-my-zsh"
  "tmux"
  "vim"
  "zsh"
)

case "$1" in

  init)
    stow -t "$HOME" "${STOW_MODULES[@]}"
    ;;

  test)
    stow -t "$HOME" -n "${STOW_MODULES[@]}"
    ;;

  reinit)
    stow -t "$HOME" -R "${STOW_MODULES[@]}"
    ;;

  adopt)
    stow -t "$HOME" --adopt "${STOW_MODULES[@]}"
    ;;

  *)
    echo "Invalid command $1"
    exit 1
    ;;

esac

