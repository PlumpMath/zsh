# Operating System
if [ -z "${OS}" ]; then
  export OS=$(uname -s)
fi

# Unicode
export UTF8=$(locale -m|grep -i 'utf'|head -1)
export NCURSES_NO_UTF8_ACS="1"
export MM_CHARSET="UTF-8"

# Locales
export LANG="en_US.${UTF8}"
export LC_TIME="de_DE.${UTF8}"
export LC_NUMERIC="en_US.${UTF8}"
export LC_MONETARY="de_DE.${UTF8}"
export LC_MESSAGES="en_US.${UTF8}"
export LC_CTYPE="en_US.${UTF8}"
export LC_COLLATE="C"
export LC_ALL=

# Applications
export EDITOR="vim"
export PAGER="less"

# Aliases
alias vim="vim -p"
alias gvim="gvim -p"
alias mvim="mvim -p"
alias top="top -HS"

# Platform
case ${OS} in
OpenBSD)
  export PKG_PATH="http://ftp.halifax.rwth-aachen.de/openbsd/$(uname -r)/packages/$(uname -m)/"
  ;;
Linux)
  alias grep="grep --color=auto"
  ;;
Windows*)
  alias grep="grep --color=auto"
  export NODE_PATH="/c/Users/$(whoami)/AppData/Roaming/npm/node_modules"
  export PATH="${PATH}:/c/Users/$(whoami)/AppData/Roaming/npm"
  export PATH="${PATH}:/c/Program Files/nodejs"
  export PATH="${PATH}:/c/Program Files/NASM"
  export PATH="${PATH}:/c/Program Files (x86)/CMake/bin"
;;
esac
