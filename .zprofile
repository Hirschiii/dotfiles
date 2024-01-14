export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

export MOZ_ENABLE_WAYLAND=1

export PATH="$PATH:~/.local/share/gem/ruby/3.0.0/bin:~/go/bin/:$HOME/zk/bin:~/.local/bin/wm-scripts/"
export PATH="$PATH:$HOME/env/bin/:$HOME/git/lua-language-server/bin/"
export PATH="$PATH:/opt/gradle/gradle-8.5/bin"



# For my second brain
export public_secondbrain=~/git/second-brain-public/content
# export secondbrain=~/notes
export ZK_NOTEBOOK_DIR=~/notes
export ZK_PATH="$HOME/notes"

export FZF_DEFAULT_OPTS="--height=40% --multi --tiebreak=begin \
  --bind 'ctrl-y:execute-silent(echo {} | pbcopy)' \
  --bind 'alt-down:preview-down,alt-up:preview-up' \
  --bind \"ctrl-v:execute-silent[ \
    tmux send-keys -t \{left\} Escape :vs Space && \
    tmux send-keys -t \{left\} -l {} && \
    tmux send-keys -t \{left\} Enter \
  ]\"
  --bind \"ctrl-x:execute-silent[ \
    tmux send-keys -t \{left\} Escape :sp Space && \
    tmux send-keys -t \{left\} -l {} && \
    tmux send-keys -t \{left\} Enter \
  ]\"
  --bind \"ctrl-o:execute-silent[ \
    tmux send-keys -t \{left\} Escape :read Space ! Space echo Space && \
    tmux send-keys -t \{left\} -l \\\"{}\\\" && \
    tmux send-keys -t \{left\} Enter \
  ]\""
