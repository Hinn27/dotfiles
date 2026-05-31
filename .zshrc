typeset -U path cdpath fpath manpath

# Standard Zsh completions
autoload -U compinit && compinit

# Plugins (Assuming installed via pacman later)
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history)

# History options
HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="/home/hinne/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

# Set shell options
set_opts=(
  HIST_FCNTL_LOCK HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY
  NO_APPEND_HISTORY NO_EXTENDED_HISTORY NO_HIST_EXPIRE_DUPS_FIRST
  NO_HIST_FIND_NO_DUPS NO_HIST_IGNORE_ALL_DUPS NO_HIST_SAVE_NO_DUPS
)
for opt in "${set_opts[@]}"; do
  setopt "$opt"
done
unset opt set_opts

# pnpm setup
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PNPM_HOME:$PATH" ;;
esac

# Starship prompt
if [[ $TERM != "dumb" ]]; then
  if command -v starship >/dev/null; then
    eval "$(starship init zsh)"
  fi
fi

# Aliases
alias -- ..='cd ..'
alias -- ...='cd ../..'
alias -- ....='cd ../../../..'
alias -- c=clear
alias -- cleanup='sudo pacman -Rns $(pacman -Qtdq) 2>/dev/null; sudo pacman -Sc --noconfirm; [ -x /usr/bin/flatpak ] && flatpak uninstall --unused -y; sudo journalctl --vacuum-time=3d'
alias -- grep='grep --color=auto'
alias -- jctl='journalctl -p 3 -xb'
alias -- la='eza -a --color=always --group-directories-first --icons'
alias -- ll='eza -l --color=always --group-directories-first --icons'
alias -- ls='eza -al --color=always --group-directories-first --icons'
alias -- lt='eza -aT --color=always --group-directories-first --icons'
alias -- mirror='sudo cachyos-rate-mirrors'
alias -- update='sudo pacman -Syu'
alias -- v=nvim

# Dotfiles management alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
