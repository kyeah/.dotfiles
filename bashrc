shopt -s nocaseglob  # Case-insensitive globbing (pathname expansion)
shopt -s cdspell     # Auto-correct when using cd
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
        shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Better color schemes
export PS1='\[\033[0;35m\]\h\[\033[0;33m\] \W\[\033[00m\]: '
export TERM=xterm-256color
export LSCOLORS="BaGxcxdxCxegedabagacad"
export GREP_OPTIONS='--color=auto -n'
export editor=emacs
export LD_LIBRARY_PATH=:/opt/OGRE-1.8/lib
export PKG_CONFIG_PATH=:/opt/OGRE-1.8/lib/pkgconfig
export PATH=$PATH:$HOME/bin:$HOME/.rvm/bin:$HOME/bin/gibo:$HOME/UserProgs/android-studio/bin:$Home/UserProgs/genymotion
# Add RVM (Ruby Virt Machine) to PATH for scripting
# Add gibo path
# Add Android-Studio, Genymotion to path

alias ls='ls --group-directories-first --time-style=+"[%m/%d/%Y %H:%M]" --color'
alias la='ls -a --group-directories-first --time-style=+"[%m/%d/%Y %H:%M]" --color'
alias ll='ls -lh --group-directories-first --time-style=+"[%m/%d/%Y %H:%M]" --color'
alias lla='ls -alh --group-directories-first --time-style=+"[%m/%d/%Y %H:%M]" --color'
alias lal='lla'

alias emacs='emacs -nw'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias pwd="pwda"
alias psa="ps aux"
alias fgls='jobs'
alias fgka='for x in `jobs -p`; do kill -9 $x; done' # KILL ALL JOBS!!!!

#######################
### Deb-based Linux ###
#######################

alias apt-get='sudo apt-get'
alias apt-install='apt-get install'
alias apt-update='apt-get update'
alias apt-remove='apt-get --purge remove'
# apt-find is defined as a function below

alias apt-installed="dpkg -l | grep"  # Find installed packages relating to query
alias apt-files="dpkg -L"             # Find files provided by installed package
alias apt-ownedby="dpkg -S"           # Find the package that owns the given file


########################
### Arch-based Linux ###
########################

alias pacs="sudo pacman -S"       # Install
alias pacsy="sudo pacman -Sy"     # Install with fresh database
alias pacsyu="sudo pacman -Syu"   # Update / Upgrade
alias pacrm="sudo pacman -R"      # Remove
alias pacf="sudo pacman -Ss"      # Search for package

alias pac-get="pacsy"
alias pac-update="pacsyu"
alias pac-remove="pacrm"
alias pac-find="pacf"  

alias ya="yaourt -Sy"   # Install AUR package with fresh database
alias yas="yaourt -Ss"  # Search AUR packages

############################

alias bd='cd $OLDPWD'
alias push='pushd'  # Never going to use these ever
alias pop='popd'    # Use dirs to print stack

shopt -s cmdhist        # Combine multiline commands into one in history
shopt -s histappend
shopt -s hostcomplete
export HISTSIZE=10000
export HISTCONTROL=ignoredups  # Ignore dups, bare ls and builtin cmds
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:[bf]g:exit"

alias h="history | grep"  # Run desired command with !<history num>
alias f="find . | grep"
alias dopen='xdg-open'
alias odoc='dopen'

alias gitlog="git log --graph --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gitrma="!sh -c \"git diff -z --name-only --diff-filter=D | xargs -0 git rm\""
alias gitunstage="git reset HEAD"
alias gitinfo="git remote show origin"
alias gitbranch="git branch 2> /dev/null | sed -e \"/^[^*]/d\" -e \"s/* \(.*\)/(git:\1)/\""

# Allow tab completion to propagate through sudo commands
complete -cf sudo

#################
### FUNCTIONS ###
#################

# Trim animations. If each frame occupies a different-sized portion, this will ruin offsets.
trimanim () {
    bgcolor="null"
    if [[ -z "$3" ]]; then
        bgcolor=${3}
    fi

    if [ $# -gt 1 ]; then
        convert $1 -trim +repage -layers TrimBounds -set dispose background -coalesce -scene 1 $2
        if [ bgcolor != "null" ]; then
            convert $2 -alpha off -background ${bgcolor} $2
        fi
    fi
}

# kill job by job #
fgkill () {
   jobfindcmd="sed -n -e "$1"p"
   echo $jobfindcmd
   job=`jobs -p | ${jobfindcmd}`
   kill -9 $job
}

# open nautilus in given dir (default working dir)
opendir () {
    if [ $# -gt 0 ]; then
        for dir in $@
        do
            if [ -d "$dir" ]; then
                thunar $dir >/dev/null 2>/dev/null &     
                # nautilus $dir >/dev/null 2>/dev/null &  # GNOME default file manager
            fi
        done
    else
        thunar "$PWD" & > /dev/null
        # nautilus "$PWD" & > /dev/null
    fi
}

# show diff from nth last HEAD
gitdiff () {
    distance=0
    if [ $# -gt 0 ]; then
        distance=$1
    fi

    git diff HEAD~$distance
}

# find and delete all matching regex
nuke () {
    if [ $# -gt 0 ]; then
        for reg in $@
        do
            find -name "$reg" -exec rm -f {} +
        done
    fi
}

# pwd enhanced function to show linked vs. physical dir differences.
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

convert-anim-skip () {
    # This script will take an animated GIF and delete every other frame
    # Accepts three parameters: skip step, input file and output file
    # Usage: convert-anim-skip <skipStep> input.gif output.gif
    # To check current delay, run identify -verbose output.gif | grep Delay

    if [ $# -eq 3 ]; then
        cp $2 $3
        numframes=`convert $3 -format "%[scenes]" info: | tail -n 1`

        # delete frames
        gifsicle "$2" --unoptimize $(seq -f "#%g" 0 $1 $numframes) -O2 -o "$3"
    fi
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
        echo "Please provide a package to search for."
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
    grep -v "^ " ${tmp_list} | awk -F: '{printf "\033[1;32m"$1"\033[0m: "$2"\n"}'
    echo
    echo "############# Available #################"
    echo
    cat ${tmp_alist} | sed "s/dpkg-query:\ no\ packages\ found\ matching\ //g" | grep -v "No packages" | awk -F: '{printf "\033[1;31m"$1"\033[0m: "$2"\n"}'
    echo
}

export -f fgkill
export -f opendir
export -f gitdiff
export -f nuke
export -f pwda
export -f up
export -f mkuniq
export -f mkgibo
export -f flac2mp3
export -f extract
export -f apt-find
export -f convert-anim-skip
