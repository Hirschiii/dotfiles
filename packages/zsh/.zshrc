# For context to work
# export TEXMF="$TEXMF:$HOME/texmf:/usr/local/texlive/2024/texmf-dist"
# export TEXMFHOME=$HOME/texmf
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line




# Enable colors and change prompt:
autoload -U colors && colors

# OVERDUE='󰚌 '
# DUETODAY=' '
# DUETOMORROW='󰃭 '
# URGENT=''

# function task_indikator {
# 	TASK="task"
# 	if [[ `$TASK +READY +OVERDUE count rc.context:none` -gt "0" ]]; then
# 		echo "$OVERDUE"
# 	elif [[ `$TASK +READY +TOMORROW count rc.context:none` -gt "0" ]]; then 
# 		echo "$DUETOMORROW"
# 	elif [[ `$TASK +READY +TODAY count rc.context:none` -gt "0" ]]; then 
# 		echo "$DUETODAY"
# 	elif [[ `$TASK +READY urgency.over:20 count rc.context:none` -gt "0" ]]; then 
# 		echo "$URGENT"
# 	else
# 		echo ' '
# 	fi
# }

# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1d%{$fg[red]%}]%{$reset_color%}$%b "
# PS1='%~ $: '
# PS1="%B%{%F{1}%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%(5~|%-1~/.../%3~|%4~) %{$reset_color%}%% $(task_indikator): "
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%(5~|%-1~/.../%3~|%4~) %{$reset_color%}%%: "




# # History in cache directory:
# HISTSIZE=10000
# SAVEHIST=10000
# HISTFILE=~/.cache/zsh/history


# to share this history between terminals
# setopt SHARE_HISTORY
setopt NO_NOMATCH

# to save history between sessions
HISTSIZE=1000
if (( ! EUID )); then
	HISTFILE=~/.config/zsh/history_root
else
	HISTFILE=~/.config/zsh/history
fi
SAVEHIST=1000
#SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Unicode support:
setopt MULTIBYTE
setopt COMBINING_CHARS

setopt NOBEEP

# Basic auto/tab complete:
autoload -U compinit promptinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# CTRL-R - Paste the selected command from history into the command line

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Edit line in vim with ctrl-e:
# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/zshnameddirrc" ] && source "$HOME/.config/zsh/zshnameddirrc"
[ -f "$HOME/.config/zsh/zsh_alias" ] && source "$HOME/.config/zsh/zsh_alias"
[ -f "$HOME/.config/zsh/taskwarrior.zsh" ] && source "$HOME/.config/zsh/taskwarrior.zsh"
[ -f "$HOME/.config/zsh/quitcd.zsh" ] && source "$HOME/.config/zsh/quitcd.zsh"
[ -f "$HOME/.config/zsh/zsh-keybinding" ] && source "$HOME/.config/zsh/zsh-keybinding"
[ -f "$HOME/.config/zsh/theme" ] && source "$HOME/.config/zsh/theme"
[ -f "/usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh"
[ -d "$HOME/context/tex/texmf-linux-64/bin" ] && export PATH=/home/niklas/context/tex/texmf-linux-64/bin:$PATH
[ -d "$HOME/go/bin" ] && export PATH=/home/niklas/go/bin:$PATH

# Changing "ls" to "exa"
alias ls='eza -l --color=always --group-directories-first' # my preferred listing
alias la='eza -la --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'


# Herbstluftwm

# alias hc="herbstclient"


alias vim="nvim"


# alias kara="java -Dsun.java2d.uiScale=2.0 -jar ~/Downloads/kara.jar"


# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# auto-start sway on tty1
# if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#     dbus-run-session sway
# fi
if [ "$(tty)" = "/dev/tty1" ]; then
    # export `gnome-keyring-daemon --start --components=ssh`
	# export WAYLAND_DISPLAY=wayland-0
    exec dbus-run-session /usr/bin/sway > $XDG_RUNTIME_DIR/sway.log 2>&1
    # exec dbus-run-session /usr/bin/sway > $XDG_RUNTIME_DIR/sway.log 2>&1
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# devmon 2>&1 > /dev/null &
