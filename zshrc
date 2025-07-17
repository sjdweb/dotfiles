# ~/.zshrc

# Core environment variables
export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin
export EDITOR="vim"
export BUNDLER_EDITOR="vim"
export MANPAGER="less -X" # Don't clear the screen after quitting a manual page
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export SOURCE_ANNOTATION_DIRECTORIES="spec"
export DISABLE_AUTO_TITLE=true
export _Z_OWNER=$USER

# Zsh options
setopt auto_cd
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
cdpath=($HOME/Code $HOME/dotfiles $HOME/Developer $HOME/Sites $HOME/Dropbox $HOME)

# History configuration
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
HIST_STAMPS="yyyy-mm-dd"

# Load modular configuration
source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/zsh/functions
source $HOME/dotfiles/zsh/z.sh

# Load Homebrew completions (Apple Silicon)
if type brew &>/dev/null; then
  FPATH=/opt/homebrew/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# asdf version manager
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Starship prompt
eval "$(starship init zsh)"

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting (must be last)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Include local settings
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local