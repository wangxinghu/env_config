# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="random"
ZSH_THEME="www"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
 [[ -s ~/.autojump/etc/profile.d/autojump.sh  ]] && source ~/.autojump/etc/profile.d/autojump.sh
 autoload -U compinit
 compinit
 setopt correctall
 autoload -U promptinit
 promptinit

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
alias 'gitmg'='git merge --no-commit --no-ff -Xignore-all-space'
alias 'testvm'='/Users/wangxinghu/work/bak/test.sh'
alias 'testflight'='/Users/wangxinghu/work/bak/testflight.sh'
alias 'als'='/Users/wangxinghu/work/bak/als.sh'
alias 'onlinevpc'='/Users/wangxinghu/work/bak/onlinevpc.sh'
alias 'online'='/Users/wangxinghu/work/bak/online.sh'
alias 'onlinecn'='/Users/wangxinghu/work/bak/onlinecn.sh'
alias 'ctags'='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
alias 'webstart'='/Users/wangxinghu/st/github/mygit/env_config/webserv.sh'
alias 'tmuxopen'='/Users/wangxinghu/st/github/mygit/env_config/tmuxopen.sh'
alias 'vi'='/usr/local/bin/vim'
alias 'vim'='/usr/local/bin/vim'
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
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
#export PS1="\u@\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
