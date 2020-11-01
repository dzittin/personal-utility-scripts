# Function to print a string in a specified color on stdout.
# Colors are specified by strings shown in the associative array
# indices below.  Usage: ColorName "a string"
# Usage: colors [-n] ColorName String
# ColorNames are defined in associative array below
# -n: no newline. Escape sequences will be translated as per the -e 
# flag of the echo command.


declare -A _Colors=(
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

function colors () {

	nflag=

	case "$1" in
		-n) 
			nflag=-n
			shift
			;;
	esac

	if [ $# != 2 ]
	then
		echo Error: $0 in function ${FUNCNAME[0]}: \'${FUNCNAME[0]} ColorName String\'
		return  1
	fi

	if [ ${_Colors[$1]+x}  ]
	then
		echo $nflag -e ${_Colors[$1]}$2${_Colors[Off]}
	else
		echo "$0: Do not recognize the color '$1'." >&2
		return 1
	fi
	return 0

}

# Print three words on one line
colors -n BoldYellow "hi"
colors -n BoldCyan " there"
colors BoldRed " world"

echo -n "wc pipe test"; colors Purple "hi there world" | wc
colors BoldBlue "hi there world blue"
colors BoldYellow "hi there world yellow"
colors BoldCyan "hi there world cyan"
colors -n BoldCyan "hi there"
colors -n BoldGreen  " world"
colors BoldYellow " and sun"
