export PS1='\[\033[0;35m\]\h\[\033[0;33m\] \W\[\033[00m\]: '
export LSCOLORS="BaGxcxdxCxegedabagacad"
alias ls='ls --color'

export editor=emacs
alias emacs='emacs -nw'
alias ..='cd ..'
alias ...='cd ...'
alias fgls='jobs'

alias gitlog="log --graph --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gitrma="!sh -c \"git diff -z --name-only --diff-filter=D | xargs -0 git rm\""
alias gitunstage="git reset HEAD"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
