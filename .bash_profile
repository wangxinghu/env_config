alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color=auto'
alias vi='vim'
alias gco='git checkout'
alias gs='git status'
alias ga='git add'
alias gci='git commit'
alias gb='git branch'
alias gd='git diff'
alias gdc='git diff --cached'
alias 'gitmg'='git merge --no-commit --no-ff -Xignore-all-space'
alias 'gitpick'='git cherry-pick --no-commit --no-ff -Xignore-all-space'
alias histg='history | grep '
alias ..='cd ..'
alias ...='cd ../..'
alias psg='ps aux | grep '
alias listen='lsof -P -i -n'
alias port='netstat -tulanp'
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1  ;;
            *.tar.gz)   tar xzf $1  ;;
            *.bz2)      bunzip2 $1  ;;
            *.rar)      unrar e $1  ;;
            *.gz)       gunzip $1   ;;
            *.tar)      tar xf $1   ;;
            *.tbz2)     tar xjf $1  ;;
            *.tgz)      tar xzf $1  ;;
            *.zip)      unzip $1    ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z x $1     ;;
            *)          echo "'$1' cannot be eztracted via extract()"
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad
export GOPATH='/Users/wangxinghu/work/farm/async_service'
alias 'testvm'='/Users/wangxinghu/work/bak/test.sh'
alias 'testflight'='/Users/wangxinghu/work/bak/testflight.sh'
alias 'als'='/Users/wangxinghu/work/bak/als.sh'
alias 'onlinevpc'='/Users/wangxinghu/work/bak/onlinevpc.sh'
alias 'online'='/Users/wangxinghu/work/bak/online.sh'
alias 'onlinecn'='/Users/wangxinghu/work/bak/onlinecn.sh'
alias 'ctags'='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
alias 'vi'='/usr/local/bin/vim'
alias 'vim'='/usr/local/bin/vim'
alias 'webstart'='/Users/wangxinghu/st/github/mygit/env_config/webserv.sh'
alias 'tmuxopen'='/Users/wangxinghu/st/github/mygit/env_config/tmuxopen.sh'
alias 'gitphp'=git_status_check_php
alias 'phpd'='php -dxdebug.remote_autostart=1 -dxdebug.remote_port=8989'
git_status_check_php() {
    git status | grep 'php$' | awk -F ':' '{if($1 ~ /php$/) print "php -l", $1; else print "php -l", $2}' | bash
    #git status | grep 'php$' | awk -F ':' '{if($1 ~ /php$/) print $1; else print $2}' | xargs -n 1 php -l
}
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export TERM=xterm-256color
ulimit -n 10240
export PS1="\u@\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
if [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
    . /usr/local/etc/profile.d/bash_completion.sh
fi
