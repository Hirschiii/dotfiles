# alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'

# yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "


# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

alias eisvogel='pandoc $1 -o output.pdf -s --toc --from markdown --to pdf --template=eisvogel.latex --number-sections'
alias mathjax='pandoc --mathjax=https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js -s $1 -o output.html'

# Work

alias summary="task summary"

alias mydoc_web="doas quark -h 127.0.0.1 -p 80 -d ~/notes/site"

alias musescore_dl="npx msdl"

noter() { nvim + "$(date +"%y-%m-%d %H:%M" | while read d t ; do f=$HOME/notes/daily/$d ; ( echo; echo $t ; echo ) >> "$f" ; echo "$f"; done; )" ; }

alias habit="task rc.data.location=~/.habit"

alias tasksync="task sync && trellowarrior sync"

alias next="taks next limit:1"

coffitivity() {
	mpv --no-video $(yta-aac -g https://www.youtube.com/watch?v=7OeCjkG_xuI)
}

lofi() {
  mpv --no-video $(yta-aac -g https://www.youtube.com/watch?v=jfKfPfyJRdk)
}

# Taskwarrior:

alias t=task
alias tn='clear;task next'
alias ta='task add'
alias tan='task add scheduled:today'
alias tat='task add scheduled:tomorrow until:sch+14d'
alias tm='task modify'
# alias td='clear;task next +ACTIVE or +OVERDUE or due:today or scheduled:today or pri:H; calcurse -r; timew | grep -v "no active time"'
alias td='clear;task next +ACTIVE or +OVERDUE or due:today or scheduled:today or pri:H;  timew | grep -v "no active time"'
alias tal='task add dep:"$(task +LATEST uuids)"'

# ZK
alias edit="zk edit --interactive" 
alias journal="zk new $ZK_NOTEBOOK_DIR/journal --group journal --no-input"


alias serve_http='python3 -m http.server'
