if [ "$#" = 1 -a ! -r "$1"  ]
then
    echo got it right only one "$1"
else
    echo got it wrong argc="$#" and arg="$*"
fi
echo "$#"
