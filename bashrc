export PS1='\[\033[0;35m\]\h\[\033[0;33m\] \W\[\033[00m\]: '
export TERM=xterm-256color
export LSCOLORS="BaGxcxdxCxegedabagacad"
export GREP_OPTIONS='--color=auto -n'
export editor=emacs

alias ls='ls --color'
alias la='ls -a --color'
alias ll='ls -lh --color'
alias lla='ls -alh --color'
alias lal='lla'

alias emacs='emacs -nw'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias pwd="pwda"
alias psa="ps aux"
alias fgls='jobs'
alias apt-get='sudo apt-get'
alias apt-install='apt-get install'
alias apt-update='apt-get update'
alias apt-remove='apt-get --purge remove'
# apt-find is defined as a function below

alias apt-installed="dpkg -l | grep"  # Find installed packages relating to query
alias apt-files="dpkg -L"             # Find files provided by installed package
alias apt-ownedby="dpkg -S"           # Find the package that owns the given file

alias bd='cd $OLDPWD'
alias push='pushd'  # Never going to use these ever
alias pop='popd'    # Use dirs to print stack

shopt -s cmdhist        # Combine multiline commands into one in history
HISTCONTROL=ignoredups  # Ignore dups, bare ls and builtin cmds
HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:[bf]g:exit"

alias h="history | grep"
alias f="find . | grep"
alias dopen='xdg-open'

alias gitlog="git log --graph --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gitrma="!sh -c \"git diff -z --name-only --diff-filter=D | xargs -0 git rm\""
alias gitunstage="git reset HEAD"
alias gitbranch="git branch 2> /dev/null | sed -e \"/^[^*]/d\" -e \"s/* \(.*\)/(git:\1)/\""

# Allow tab completion to propagate through sudo commands
complete -cf sudo

PATH=$PATH:$HOME/bin:$HOME/.rvm/bin:$HOME/UserProgs/android-studio/bin:$Home/UserProgs/genymotion
# Add RVM (Ruby Virt Machine) to PATH for scripting
# Add Android-Studio, Genymotion to path

pwda () {
    link=$(\pwd -L)
    physical=$(\pwd -P)
    if [ $link == $physical ]; then
       echo ${link}
    else
       echo "Linked:   "${link}
       echo "Physical: "${physical} 
    fi
}

# up - goes up n directory levels
up(){
        local d=""
        limit=$1
        for ((i=1 ; i <= limit ; i++))
        do
                d=$d/..
        done
        d=$(echo $d | sed 's/^\///')
        if [ -z "$d" ]; then
                d=..
        fi
        cd $d
}
 
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

# Mega-fancy package-finder
apt-find () {
    tmp_list=/tmp/apt_tmp_list.txt
    tmp_alist=/tmp/apt_tmp_alist.txt
    
    if [ -w ${tmp_list} ]; then
        rm -f ${tmp_list}
    fi

    if [ -w ${tmp_alist} ]; then
        rm -f ${tmp_alist}
    fi
    
    if [ -z ${1} ]; then
        echo "Give parameter to work with..."
        return
    fi
    
    for i in `apt-cache search ${1} | awk -F " - " '{ print $1 }'`
    do 
        list=("${list[@]}" "${i}")
    done
 
    dpkg-query -W -f='${Package}\t${Version}\n${Description}\n\n' ${list[@]} >${tmp_list} 2>${tmp_alist}
    clear
    echo "############# Installed #################"
    echo
    grep -v "No packages" ${tmp_list} | awk -F: '{printf "\033[1;32m"$1"\033[0m: "$2"\n"}'
    echo
    echo "############# Available #################"
    echo
    cat ${tmp_alist} | sed "s/dpkg-query:\ no\ packages\ found\ matching\ //g" | grep -v "No packages" | awk -F: '{printf "\033[1;31m"$1"\033[0m: "$2"\n"}'
    echo
}

export -f pwda
export -f up
export -f mkuniq
export -f mkgibo
export -f flac2mp3
export -f extract
export -f apt-find