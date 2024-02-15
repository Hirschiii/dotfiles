#!/bin/bash

selected=$(curl -s cheat.sh/:list | fzf --prompt="Select language > ")
query=$(curl -s cht.sh/$selected~languages | sed 's/\(.*\)/\1/' | fzf --prompt="Select command > ")

curl -s cht.sh/$selected/$query | less -R
