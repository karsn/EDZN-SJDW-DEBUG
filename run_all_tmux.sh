#!/bin/bash
# Tanky Woo@2013-06-19 10:51:15
# About:

#tmux start-server

if ! $(tmux has-session -t 'tankywoo'); then
        tmux new-session -d -s 'tankywoo' -n 'tankywoo' # -d *
        tmux select-window -t 'tankywoo'
        #tmux split-window -h -p 60
        tmux split-window -h
        tmux select-pane -t 1
        #tmux split-window -v -p 25
        #tmux split-window -v
        tmux select-pane -t 0
        tmux send-keys -t 0 'ipython' C-m
        tmux send-keys -t 1 'ipython' C-m 
        #tmux send-keys -t 2 'ipython' C-m
        # The C-m at the end is interpreted by Tmux as the enter key.

        #tmux new-window -n 'ops-dev'

        #tmux select-window -t 'tankywoo'
        #tmux select-pane -t 1
fi

tmux attach-session -d -t 'tankywoo'

tmux select-session -t 'tankywoo'



#tmux select-window -t 'tankywoo'
#tmux select-pane -t 1
#tmux send-keys "echo \"pane 0 test\"" C-m

sleep 1s

tmux send-keys -t 0 "echo \"pane 0 test\"" C-m
tmux send-keys -t 1 "echo \"pane 1 test\"" C-m
#tmux send-keys -t 2 "echo \"pane 2 test\"" C-m

#tmux send-keys -t 1 "$session":"$window" "echo \"pane 0 test\"" C-m
#tmux send-keys -t 1 "tankywoo":"tankywoo" "echo \"pane 1 test\"" C-m
##tmux send-keys -t "tankywoo:tankywoo" "echo \"pane 2 test\"" C-m
