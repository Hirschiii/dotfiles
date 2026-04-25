function func_q1 {
    if [ $# -lt 1 ]; then
        task q1
    else
        task $@ mod prio:H urgent:Y
        task inbox
    fi
}
function func_q2 {
    if [ $# -lt 1 ]; then
        task q2
    else
        task $@ mod prio:H urgent:N 
        task inbox
    fi
}
function func_q3 {
    if [ $# -lt 1 ]; then
        task q3
    else
        task $@ mod prio:L urgent:Y 
        task inbox
    fi
}
function func_q4 {
    if [ $# -lt 1 ]; then
        task q4
    else
        task $@ mod prio:L urgent:N 
        task inbox
    fi
}
selectedtoady ()
{
    if [ $# -lt 1 ]; then
        task selectedtoday:Y
    else
        task $1 mod selectedtoday:Y
    fi
}
alias q1="func_q1"
alias q2="func_q2"
alias q3="func_q3"
alias q4="func_q4"

alias today="selectedtoady"

# Taskwarrior:

alias t=task
alias tn='task next'
alias ta='task add'
alias tan='task add scheduled:today'
alias tat='task add scheduled:tomorrow until:sch+14d'
alias tm='task modify'
# alias td='clear;task next +ACTIVE or +OVERDUE or due:today or scheduled:today or pri:H; calcurse -r; timew | grep -v "no active time"'
# alias td='clear;task next +ACTIVE or +OVERDUE or due:today or scheduled:today or pri:H;  timew | grep -v "no active time"'
alias tal='task add dep:"$(task +LATEST uuids)"'

# Morning routine
alias morning='task +OVERDUE list; task due:today list; task +urgent list; task inbox'

# End of day review  
alias evening='task completed end:today; task +next limit:5; task inbox'

# Quick add with inbox processing
alias in='task add +inbox'
