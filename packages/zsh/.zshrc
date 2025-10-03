export EDITOR=nvim

autoload edit-command-line; zle -N edit-command-line

# Enable colors and change prompt:
autoload -U colors && colors

# Tab Completion and style

autoload -U compinit
compinit

zstyle ':completion:*' menu select
zmodload zsh/complist

set -o vi
bindkey -v '^?' backward-delete-char


zstyle ':completion::complete:*' use-cache 1

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

_comp_options+=(globdots)		# Include hidden files.


# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Command correction

# setopt correctall

# Prompt

# autoload -U promptinit
# promptinit
#
# prompt gentoo

PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%(5~|%-1~/.../%3~|%4~) %{$reset_color%}%%: "


# History

export HISTSIZE=2000
export HISTFILE="$HOME/.history"

## Save to file
export SAVEHIST=$HISTSIZE

## Ignore double entries
setopt hist_ignore_all_dups

## Ignore commands with space before:
setopt hist_ignore_space

# to share this history between terminals
# setopt SHARE_HISTORY
setopt NO_NOMATCH

# Unicode support:
setopt MULTIBYTE
setopt COMBINING_CHARS

setopt NOBEEP


# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/zshnameddirrc" ] && source "$HOME/.config/zsh/zshnameddirrc"
[ -f "$HOME/.config/zsh/alias.zsh" ] && source "$HOME/.config/zsh/alias.zsh"
[ -f "$HOME/.config/zsh/taskwarrior.zsh" ] && source "$HOME/.config/zsh/taskwarrior.zsh"
[ -f "$HOME/.config/zsh/quitcd.zsh" ] && source "$HOME/.config/zsh/quitcd.zsh"
[ -f "$HOME/.config/zsh/keybindings.zsh" ] && source "$HOME/.config/zsh/keybindings.zsh"
[ -f "/usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh"

# Das wichtigste:

alias vim="nvim"

alias ls="ls --color"

if [ "$(tty)" = "/dev/tty1" ]; then
    # export `gnome-keyring-daemon --start --components=ssh`
	# export WAYLAND_DISPLAY=wayland-0
    # exec dbus-run-session /usr/bin/hyprland > $XDG_RUNTIME_DIR/sway.log 2>&1
	# exec Hyprland > $XDG_RUNTIME_DIR/hypr.log 2>&1
    exec dbus-run-session /usr/bin/sway > $XDG_RUNTIME_DIR/sway.log 2>&1
fi

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
