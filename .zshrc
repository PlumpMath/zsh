# Functions
autoload -U colors && colors
autoload -U compinit && compinit

# Completion
zstyle ':completion:*' hosts off
zstyle ':completion:*' users off

# Limits
ulimit -S -c 0

# History
HISTSIZE=100
SAVEHIST=100
HISTFILE="$HOME/.zshinfo"

# Options
setopt append_history
setopt autocd
setopt cdablevars
setopt hist_ignore_dups
setopt hist_ignore_space
setopt interactive_comments
setopt no_beep

# Settings
source ${HOME}/.zsh/keys.zsh
source ${HOME}/.zsh/spectrum.zsh
source ${HOME}/.zsh/termsupport.zsh
source ${HOME}/.zsh/settings.zsh

# Profile
source ~/.profile

# Functions
function shell {
  local NAME="$1"
  local COMMAND="$2"
  local DIRECTORY="$3"
  if [ -z "${NAME}" ]; then
    echo "usage: $0 <name> [command] [directory]"
    tmux list-sessions
    return 1
  fi
  tmux has-session -t "${NAME}" 2>/dev/null
  if [ "$?" -eq 1 ]; then
    if [ -n "${DIRECTORY}" ]; then
      pushd "${DIRECTORY}"
    fi
    if [ -n "${COMMAND}" ]; then
      tmux new-session -d -s "${NAME}" "${COMMAND}"
    else
      tmux new-session -d -s "${NAME}"
    fi
  fi
  tmux attach-session -t "${NAME}"
}
