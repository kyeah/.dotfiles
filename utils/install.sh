#!/bin/bash

TYPE_IGNORE=1
TYPE_LINK=2
TYPE_SPECIAL=3

ignore=( el utils backups )
special=( terminalrc )
specialpath=( ~/.config/Terminal/terminalrc )

DIR=~/.dotfiles

cd $DIR
for filename in *
do
    installpath=~/.${filename}
    filetype=TYPE_LINK
    specialindex=0
    
    # check if the file has a special installation path
    for specialname in ${special[@]}
    do
        if [[ $filename == $specialname ]]
        then
            filetype=TYPE_SPECIAL
            installpath=${specialpath[specialindex]}
            break
        fi
        
        true $((specialindex++))
    done
    
	# check if the file should be ignored        
        if ! [[ $filetype == TYPE_SPECIAL ]]
        then
	    for ignorename in ${ignore[@]}
	    do
	        if [[ $filename == $ignorename ]]
	        then
		    filetype=TYPE_IGNORE
	        fi
	    done
        fi

	# if you shouldn't ignore, and it's not already linked
	if [ $filetype != TYPE_IGNORE -a ! -L $installpath ]
	then

		# move old versions moved to backup dir
		if [ -e $installpath ]
		then
			echo ${filename} moved to ${DIR}/backups/${filename}
			mv $installpath $DIR/backups/
		fi

		# create the link
		echo new link $installpath to ${DIR}/backups/${filename}
		ln -s $DIR/$filename $installpath
	fi
done

# update the submodules
git submodule update --init

# source bashrc
source ~/.bashrc


# to add new submodules use git submodule add [repo] [path to folder]
