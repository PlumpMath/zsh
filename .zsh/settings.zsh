# =============================================================================
# Colors
# =============================================================================
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"

LC_COLORS=
LS_COLORS="${LS_COLORS}di=1;34:"
LS_COLORS="${LS_COLORS}ln=35;40:"
LS_COLORS="${LS_COLORS}so=32;40:"
LS_COLORS="${LS_COLORS}pi=33;40:"
LS_COLORS="${LS_COLORS}ex=31;40:"
LS_COLORS="${LS_COLORS}bd=34;46:"
LS_COLORS="${LS_COLORS}cd=34;43:"
LS_COLORS="${LS_COLORS}su=0;41:"
LS_COLORS="${LS_COLORS}sg=0;46:"
LS_COLORS="${LS_COLORS}tw=0;42:"
LS_COLORS="${LS_COLORS}ow=0;43:"
export LS_COLORS

# =============================================================================
# Path
# =============================================================================
if [ "$OSTYPE" = "msys" ]; then
  export PATH="/mingw64/bin:$PATH"
fi

# =============================================================================
# Aliases
# =============================================================================
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

case $OSTYPE in
openbsd*)
  alias ls='colorls -G'
  alias ll='ls -lh'
  ;;
freebsd*)
  alias ls='ls'
  alias ll='ls -lh -D "%F %H:%M"'
  ;;
darwin*)
  alias ls='gls --color=auto'
  alias ll='ls -lh --time-style long-iso'
  ;;
*)
  alias ls='ls --color=auto --group-directories-first'
  alias ll='ls -lh --time-style long-iso'
  ;;
esac

alias tmux="tmux -2"
alias ta="tmux attach -t"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"

# =============================================================================
# MSYS2
# =============================================================================
if [ "$OSTYPE" = "msys" ]; then
  echo -ne   '\e]4;0;#000000\a' # Black
  echo -ne   '\e]4;8;#313131\a' # Black (Bold)
  echo -ne   '\e]4;1;#ff615a\a' # Red
  echo -ne   '\e]4;9;#ff615a\a' # Red (Bold)
  echo -ne   '\e]4;2;#b1e969\a' # Green
  echo -ne  '\e]4;10;#b1e969\a' # Green (Bold)
  echo -ne   '\e]4;3;#ebd99c\a' # Yellow
  echo -ne  '\e]4;11;#ebd99c\a' # Yellow (Bold)
  echo -ne   '\e]4;4;#5da9f6\a' # Blue
  echo -ne  '\e]4;12;#5da9f6\a' # Blue (Bold)
  echo -ne   '\e]4;5;#e86aff\a' # Magenta
  echo -ne  '\e]4;13;#e86aff\a' # Magenta (Bold)
  echo -ne   '\e]4;6;#82fff7\a' # Cyan
  echo -ne  '\e]4;14;#82fff7\a' # Cyan (Bold)
  echo -ne   '\e]4;7;#dedacf\a' # White
  echo -ne  '\e]4;15;#ffffff\a' # White (Bold)
  echo -ne    '\e]11;#171717\a' # Background
  echo -ne    '\e]10;#dedacf\a' # Foreground
  echo -ne '\e]4;262;#bbbbbb\a' # IMECursor
  echo -ne    '\e]12;#bbbbbb\a' # Cursor
fi

# =============================================================================
# Prompt
# =============================================================================
if [ -n "$SSH_TTY" ]; then
  INFO="${INFO}[%n@%m]"
fi
if [ -n "$TMUX" ]; then
  INFO="${INFO}[$(tmux ls|head -$(echo $TMUX|awk -F, '{print $3 + 1}')|tail -1|cut -d: -f1)]"
fi

if [ "$(id -u)" = "0" ]; then
  ROOT=1
fi

case $TTY in
/dev/ttyv*)
  PRIV="»"
  ;;
*)
  PRIV="❯"
  ;;
esac

PROMPT="$FG[071]$INFO$FX[bold]%30<..<%~${ROOT:+$FG[001]}$PRIV$FX[reset] "

unset INFO
unset ROOT
unset PRIV
