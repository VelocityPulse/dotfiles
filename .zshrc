export PROMPT="%B%F{red}%n%f%b%  [%*] %F{blue}%B%~%b%f -> "

##History
setopt HIST_IGNORE_ALL_DUPS

if [ -z "$HISTFILE" ]; then
	HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

export RPROMPT="[%j]"
export EDITOR=vim

alias gww='gcc -Wall -Wextra -Werror'
alias gft='gww -lft -I libft -L libft'
alias gterm='gft -ltermcap'
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -lA'

##ALIAS GIT
alias gst='git status'
alias gl='git log'
alias gpl='git pull'
alias gps='git push'

bindkey -e

export GOPATH=$HOME/go



export PATH=$GOPATH:~/bin:~/.brew/bin:$PATH
