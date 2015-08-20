#!/bin/sh

cmd=$(which tmux) # tmux path
session=happy   # session name

if [ -z $cmd ]; then
    echo "You need to install tmux."
    exit 1
fi

$cmd has -t $session 2> /dev/null

if [ $? != 0 ]; then
    $cmd new -d -n sourcecode -s $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/st/sourcecode/' C-m
    $cmd neww -n github -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/st/github/' C-m
    $cmd neww -n work -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/work/' C-m
    $cmd neww -n work_server -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/work/' C-m
    $cmd neww -n log -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/work/farm/log/ffs/' C-m
    #$cmd send-keys -t $session 'tail -f ~/work/farm/log/ffs/ffsserverwf.log' C-m
    $cmd splitw -h -p 50 -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/work/farm/log/ffs/' C-m
    #$cmd send-keys -t $session 'tail -f ~/work/farm/log/ffs/error.txt' C-m
    $cmd neww -n db -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/' C-m
    $cmd send-keys -t $session "mysql -uroot -h127.0.0.1" C-m
    $cmd send-keys -t $session "use farm_1" C-m
    $cmd splitw -h -p 50 -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/' C-m
    $cmd send-keys -t $session "mongo" C-m
    $cmd send-keys -t $session "use farm_1" C-m
    $cmd neww -n testvm -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/' C-m
    #$cmd send-keys -t $session "testvm" C-m
    $cmd splitw -h -p 50 -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/' C-m
    #$cmd send-keys -t $session "testflight" C-m
    $cmd neww -n online_log -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/' C-m
    $cmd splitw -h -p 50 -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/' C-m
    $cmd neww -n other -t $session
    $cmd send-keys -t $session "zsh" C-m
    $cmd send-keys -t $session 'cd ~/' C-m
    $cmd selectw -t $session:1
    #$cmd neww -n mysql -t $session "mysql -uroot -h127.0.0.1"
fi

$cmd att -t $session

exit 0
