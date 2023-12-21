#!/bin/env bash

tmux has-session -t tasks 2>/dev/null
  if [ $? != 0 ]; then
	# Start a new session and window with the name 'dashboard'
	tmux new-session -d -s dashboard -n tasks

	# Split the window into multiple panes
	tmux split-window -h
	tmux split-window -v
	tmux split-window -v

	# Resize the panes as needed
	tmux select-pane -t 0
	tmux resize-pane -R 30
	tmux select-pane -t 1
	tmux resize-pane -D 10
	tmux select-pane -t 2
	tmux resize-pane -U 10
	tmux select-pane -t 3
	tmux resize-pane -L 30

	# Set up each pane with Taskwarrior commands or other relevant information
	tmux send-keys -t 0 'task next' C-m
	tmux send-keys -t 1 'task next' C-m
	tmux send-keys -t 2 'task burndown.daily' C-m
	tmux send-keys -t 3 'htop' C-m

	# Attach to the session to view the dashboard
	tmux attach-session -t dashboard
  fi
tmux attach-session -t tasks
