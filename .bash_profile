alias ll='ls -l'
alias la='ls -la'
alias vi='vim'
export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad
export GOPATH='/Users/wangxinghu/work/farm/async_service'
alias 'gitmg'='git merge --no-commit --no-ff -Xignore-all-space'
alias 'testvm'='/Users/wangxinghu/work/bak/test.sh'
alias 'testflight'='/Users/wangxinghu/work/bak/testflight.sh'
alias 'als'='/Users/wangxinghu/work/bak/als.sh'
alias 'onlinevpc'='/Users/wangxinghu/work/bak/onlinevpc.sh'
alias 'online'='/Users/wangxinghu/work/bak/online.sh'
alias 'onlinecn'='/Users/wangxinghu/work/bak/onlinecn.sh'
alias 'ctags'='/usr/local/Cellar/ctags/5.8/bin/ctags'
alias 'vi'='/usr/local/bin/vim'
alias 'vim'='/usr/local/bin/vim'
alias 'webstart'='/Users/wangxinghu/st/github/mygit/env_config/webserv.sh'
alias 'tmuxopen'='/Users/wangxinghu/st/github/mygit/env_config/tmuxopen.sh'
alias 'gitphp'=git_status_check_php
alias 'phpd'='php -dxdebug.remote_autostart=1 -dxdebug.remote_port=8989'
git_status_check_php() {
    git status | grep 'php$' | awk '{if($1 ~ /php$/) print "php -l", $1; else print "php -l", $2}' | bash
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
