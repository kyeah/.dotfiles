export PS1='\[\033[0;35m\]\h\[\033[0;33m\] \W\[\033[00m\]: '
export TERM=xterm-256color
export LSCOLORS="BaGxcxdxCxegedabagacad"
alias ls='ls --color'

export editor=emacs
alias emacs='emacs -nw'  # Emacs terminal mode with dirty 256-color hack
alias ..='cd ..'
alias ...='cd ...'

alias fgls='jobs'

alias gitlog="log --graph --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gitrma="!sh -c \"git diff -z --name-only --diff-filter=D | xargs -0 git rm\""
alias gitunstage="git reset HEAD"

PATH=$PATH:$HOME/bin:$HOME/.rvm/bin:$HOME/UserProgs/android-studio/bin:$Home/UserProgs/genymotion
# Add RVM (Ruby Virt Machine) to PATH for scripting
# Add Android-Studio, Genymotion to path

# Make all lines in a file unique
mkuniq () {
    if [ $# -eq 0 ]; then
        echo "Please provide a file to uniqify."
    else
        for var in $@
        do
            if [ -f $var ]; then
                perl -ne 'print unless $seen{$_}++' $1 >> $var.tmpmkuniq
                rm $var
                cat $var.tmpmkuniq >> $var
                rm $var.tmpmkuniq
            else
                echo $var is not a file.
            fi
        done
    fi
}

# Create .gitignore file for given languages
mkgibo () {
    for lang in $@
    do
        gibo $lang TextMate >> .gitignore
    done

    echo "*~" >> .gitignore
    echo "*#" >> .gitignore
    mkuniq .gitignore
}

# Self-explanatory, dude
flac2mp3 () {
    find "$1" -type f -name "*.flac" -print0 | while read -d $'\0' song
    
    do
        output=${song%.flac}.mp3
        avconv -i "$song" -metadata album="$1" -b 192k "$output"
    done
}

# All-in-one extractor
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
           *.tar.gz)tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
           *.tar.xz)tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
           *.bz2)bunzip2 $1 && cd $(basename "$1" /bz2) ;;
           *.rar)unrar x $1 && cd $(basename "$1" .rar) ;;
           *.gz)gunzip $1 && cd $(basename "$1" .gz) ;;
           *.tar)tar xvf $1 && cd $(basename "$1" .tar) ;;
           *.tbz2)tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
           *.tgz)tar xvzf $1 && cd $(basename "$1" .tgz) ;;
           *.zip)unzip $1 && cd $(basename "$1" .zip) ;;
           *.Z)uncompress $1 && cd $(basename "$1" .Z) ;;
           *.7z)7z x $1 && cd $(basename "$1" .7z) ;;
           *)echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

export -f mkuniq
export -f mkgibo
export -f flac2mp3
export -f extract

