#!/bin/bash

tmux has-session -t tasks 2>/dev/null
  if [ $? != 0 ]; then
      tmux new-session -d -s tasks \; \
          send-keys 'while true; do clear;task next limit:5; sleep 5; done' C-m\; \
          split-window -v -p 75 \; \
          send-keys 'tasksh' C-m\; \
          split-window -h -p 30 \; \
          send-keys 'while true; do clear;task burndown.daily; sleep 5; done' C-m\; \
          select-pane -t 1 \;
  fi
tmux attach-session -t tasks
