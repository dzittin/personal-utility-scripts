
# Function to print a string in a specified color.
# Colors are specified by strings shown in the associative array
# indices below.  Usage: ColorName "a string"

function colors () {
	if [ $# != 2 ]
	then
		echo Error: $0 in function ${FUNCNAME[0]}: \'${FUNCNAME[0]} ColorName String\'
		exit 1
	fi

	declare -A Colors=(
		[Black]="\\033[0;30m"
		[Red]="\\033[0;31m"
		[Green]="\\033[0;32m"
		[Yellow]="\\033[0;33m"
		[Blue]="\\033[0;34m"
		[Purple]="\\033[0;35m"
		[Cyan]="\\033[0;36m"

		[DarkGray]="\\033[1;30m"
		[BoldRed]="\\033[1;31m"
		[BoldGreen]="\\033[1;32m"
		[BoldYellow]="\\033[1;33m"
		[BoldBlue]="\\033[1;34m"
		[BoldPurple]="\\033[1;35m"
		[BoldCyan]="\\033[1;36m"
		[Off]="\033[0m" 	#Cancel color escape.
	)

	if [ ${Colors[$1]+x}  ]
	then
		echo -e ${Colors[$1]}$2${Colors[Off]}
	else
		echo "$0: Do not recognize the color '$1'." >&2
	fi

}

#colors Purple "hi there world" | wc
#colors blah "hi there world"
#colors BoldBlue "hi there world"
#colors BoldYellow "hi there world"
