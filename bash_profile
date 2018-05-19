# Pyenv is removing the default ability to append pyenv environment
# to the prompt. This export removes the deprecation warning.
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# But since adding pyenv to the prompt is useful anyway, this function
# re-adds it.
__pyenv_version_ps1 ()
{
    local ret=$?;
    if [ -n "${PYENV_VERSION}" ]; then
        echo -n "(${PYENV_VERSION}) "
    fi
    return $?
}

PS1="\$(__pyenv_version_ps1)${PS1}"

# Init pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Default duration for MFA
export MFA_STS_DURATION=3600

export JAVA_HOME=/home/kyeh/Programs/jdk1.8.0_40
export RUST_TEST_THREADS=1

#alias java='/usr/lib/jvm/jdk1.8.0_40/bin/java'

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
export editor='/usr/local/Cellar/emacs/25.3/bin/emacs -nw'
export EDITOR='/usr/local/Cellar/emacs/25.3/bin/emacs -nw'
# export LD_LIBRARY_PATH=:/opt/OGRE-1.8/lib:$HOME/cs/git/Fractal-Evolution/C-Genetics/libs/AntTweakBar/lib
# export PKG_CONFIG_PATH=:/opt/OGRE-1.8/lib/pkgconfig
export PATH=$PATH:$HOME/bin:$HOME/Programs/spark-1.2.0-bin-hadoop2.4/bin:$HOME/.rvm/bin:$HOME/bin/gibo:$HOME/Programs/android-studio/bin:$Home/Programs/genymotion:$Home/Programs/spark-1.2.0-bin-hadoop2.4/bin:/$HOME/Programs/idea-IC-139.224.1/bin:$HOME/mongodb3.0.3/bin:/usr/local/opt/go/libexec/bin:/Users/kevinyeh/.cargo/bin
export GOPATH=$HOME/code/go
export SPARK_HOME=$HOME/Programs/spark-1.2.0-bin-hadoop2.4
export GEOTRELLIS_HOME=$HOME/cs/git/geotrellis/spark/target/scala-2.10
# Add RVM (Ruby Virt Machine) to PATH for scripting
# Add gibo path
# Add Android-Studio, Genymotion to path

alias ls='ls -G'
alias la='ls -a -G'
alias ll='ls -lh -G'
alias lla='ls -alh -G'
alias lal='lla'

alias emacs='/usr/local/Cellar/emacs/25.3/bin/emacs -nw'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias pwd="pwda"
alias psa="ps aux"
alias fgls='jobs'
alias fgka='for x in `jobs -p`; do kill -9 $x; done' # KILL ALL JOBS!!!!
alias xcopy='xclip -sel clip < '

alias df='df -h'      # human-readable filesizes
alias free='free -m'  # MB filesies

alias dc='docker-compose'
alias dce='dc exec'

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

###########
### AWS ###
###########

alias awls='awless list instances --columns="id,zone,name,state,type,public ip,private ip,uptime,keypair,image,vpc" --sort="name,private ip,vpc"'

alias awlss='awless list instances --columns="id,name,state,private ip,uptime,vpc" --sort="name,private ip,vpc"'

alias awsqpp='export AWS_PROFILE=aws-hhs-cms-ccsq-qpp-navadevops && aws-mfa && awless switch $AWS_PROFILE us-east-1'

alias t='terraform'
alias ts='t state'
alias tp='t plan'

############################

# Directory History
DIRSTACKSIZE=8
alias dirs='dirs -v'
alias dh='dirs -v'
alias d="dh"
alias bd='cd $OLDPWD'
alias back='bd'
alias push='pushd'
alias pop='popd'

function cd() {
    if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi
 
  builtin pushd "${DIR}" > /dev/null
}

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

alias brb="bundle exec rails c"
alias best="bundle exec rake test"
alias gcoi="!git branch | cut -c 3- | fzf --reverse --preview 'git show {}' | xargs git checkout"
alias gs="git status"
alias gg="git grep"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gds="git diff --cached"
alias gco="git checkout origin"
alias gc="git checkout"
alias gd="gitdiff"
alias gl="gitlog"
alias gld='git log --graph --all --decorate --stat --date=iso'
alias ga="git add"
alias gp="git pull"
alias gu="gitunstage"
alias gi="gitinfo"
alias gb="gitbranch"
alias gbv="git branch -v"
alias ghide="git-unchanged"
alias gh="ghide"
alias gbme='git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format="%(refname:short)"' # last 10 branches worked on (personal)
alias gla="git log --all --oneline --no-merges --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative" # recent history across all branches (non-personal)
alias glme='gla --author=kevinyeah@utexas.edu' # recent history (personal)
alias gt='gla --since=00:00:00'
alias gtme='gt --author=kevinyeah@utexas.edu'
alias grc="git rebase --continue"
alias gchc="git cherry-pick --continue"
alias gitlog="git log --graph --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gitrma="!sh -c \"git diff -z --name-only --diff-filter=D | xargs -0 git rm\""
alias gitunstage="git reset HEAD"
alias gitinfo="git remote show origin"
alias gitbranch="git branch 2> /dev/null | sed -e \"/^[^*]/d\" -e \"s/* \(.*\)/(git:\1)/\""
alias git-forcetohead="git fetch --all; git reset --hard origin/master"
alias git-unchanged="git update-index --skip-worktree"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

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

# Run command detached from terminal
detach () {
    if [ $# -gt 0 ]; then
        $@ </dev/null &>/dev/null &
    fi
}

sr () {
    if [ $# -ne 2]; then
        exit
    fi
    LC_ALL=C find . -type f -name $1 -exec sed -i '' $2 {} +
}

function p () { cd "$HOME/code/$@"; }

# mkdir // cd
function mcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

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
#export -f apt-find
#export -f convert-anim-skip
export -f cd
export -f detach
export -f sr

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
#source ~/.bashrc
echo hi
export JAVA_HOME=$(/usr/libexec/java_home)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
alias javacheck="mvn -Dcheckstyle.config.location=../kickstarter-checkstyle.xml clean checkstyle:check"
export REDSHIFT_USERNAME=kyeh
alias redshift='psql -U $REDSHIFT_USERNAME -h redshift.ksr.io -p 5439 -d kickstarter'

# usage: `$ redshift_sql "SELECT COUNT(*) FROM projects"`
redshift_sql() {
  psql -A -F ',' -U $REDSHIFT_USERNAME -h redshift.ksr.io -p 5439 -d kickstarter -c "$1" | tr "," "\t" | pbcopy
}

#export PATH=$PATH:$HOME/.rbenv/bin
#export GEM_PATH=$GEM_PATH:/Library/Ruby/Gems/2.0.0/gems
#export GEM_SPEC_CACHE=/Users/kevinyeh/.rbenv/versions/2.2.5/lib/ruby/gems/specs
#export PATH=$PATH:/Users/kevinyeh/.rbenv/shims
export PATH=/Users/kevinyeh/code/kickstarter/bin:$PATH

if [ -e ~/.ksr.rc ]; then source ~/.ksr.rc; fi # Provisioned by ksr laptop script
export PATH="$HOME/.yarn/bin:$PATH"
