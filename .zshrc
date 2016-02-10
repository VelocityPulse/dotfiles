export PATH=~/bin:~/.brew/bin:$PATH
export PROMPT="%~ -> "
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
