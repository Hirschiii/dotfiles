function func_q1 {
    if [ $# -ne 1 ]; then
        task q1
    else
        task $1 mod prio:H urgent:Y
        task inbox
    fi
}
function func_q2 {
    if [ $# -ne 1 ]; then
        task q2
    else
        task $1 mod prio:H urgent:N 
        task inbox
    fi
}
function func_q3 {
    if [ $# -ne 1 ]; then
        task q3
    else
        task $1 mod prio:L urgent:Y 
        task inbox
    fi
}
function func_q4 {
    if [ $# -ne 1 ]; then
        task q4
    else
        task $1 mod prio:L urgent:N 
        task inbox
    fi
}
selectedtoady ()
{
    if [ $# -ne 1 ]; then
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
