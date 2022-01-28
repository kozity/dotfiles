alias colortest='msgcat --color=test'
alias ll='ls -lAh --color=auto'
alias ki='khal interactive'
alias kl='khal list today 7d'
alias kn='khal list now 2>/dev/null | sed --quiet 2p'
alias move='mv -i'
alias s='$EDITOR "$HOME/scratch.txt"'
alias ta='tmux new-session -As primary'
alias tmux='tmux -2'
alias touchtype='xinput set-prop 11 "libinput Disable While Typing Enabled" 0'
alias notouchtype='xinput set-prop 11 "libinput Disable While Typing Enabled" 1'
alias wttr='curl wttr.in | less -S'
alias zoomcomp='xcompmgr -c -l0 -t0 -r0 -o.00'

# RSS
alias koitoday='koi list | grep $(date +%m-%d)'
alias koiup='koi update && koi list | grep -e "$(date +%m-%d)" -e "^([0-9]\+)"'
alias news='koi list -lt news | less -S'

# CONSOLE WORK
alias bd='functions bd'
alias br='functions br'
alias bu='functions bu'
alias mn='functions mn'
alias mp='functions mp'
alias mt='functions mt'
alias vd='functions vd'
alias vm='functions vm'
alias vu='functions vu'

# FROM BASHRC
alias ls='ls --color=auto'
alias grep='grep --color=auto'
