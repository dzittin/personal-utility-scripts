#! /bin/bash

# mg = mygit, a container script for git commands.

USAGE="$0 flag\n
Flags...\n 
    -c: commit changes\n
    -s: status\n
    -add: add a file(s) to local repository (you will be prompted)\n
    -init: Create a new local depository\n
    -diff: Changes made in uncommitted files since last commit\n
    -pull: pull from remote repository\n
    -push: upload committed changes to repository\n
    -undo: replace changed files with recent unchanged versions\n
    -initremote: Connect existing remote respository to local repository"


case "$1" in
    -c | commit)
            shift
            echo -n "Commit message: "
            read msg
            git commit -m "$msg" "$@"
            ;;

    -i | -init)
            git init
            ;;

    -s | status)
            git status
            ;;

    -pull)  git pull
            ;;

    -push)  echo "Push changed files to remote"
            git push
            ;;

    -diff) git diff
            ;;

    -a | -add)
            shift
            for file in "$@"
               do
                   [ -r $file ]
                   if [ $? -eq 0 ]
                   then
                      git add $file
                   else
                      echo file $file not found
                   fi
                done
            ;;

    -undo)  echo -n "Replace changed files with head files?"
            read answ
            case "$answ" in
                 y | yes ) git checkout;;
            esac
            ;;

    -ir | -initremote) 
            shift
            git remote add origin "$1"
            git branch -M main
            git push -u origin main
                 ;;


    *|-help) echo -e $USAGE;; 

esac
