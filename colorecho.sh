# To be used as a bash include script
# Print text in color on stdout, underlined or bold. 

# Usage: colors [-n] [-b] [-u] [-red|-green|-yellow|-blue|-purple|-cyan] quoted-string
# -n: No newline printed after string
# -b: bold
# -u: underline
# string must be quoted.
@ Example:
#	colors -b -u -cyan "hi there world"
# prints the string "hi there world" underlined and bold cyan.

_MyBase='\033['
_MyBold="1"
_MyUnderline="4"

declare -A _MyColors=(
	[-red]="31"
	[-green]="32"
	[-yellow]="33"
	[-blue]="34"
	[-purple]="35"
	[-cyan]="36"
)


function colors () {

	local nflag=
	local escape=
	local string
	local bflag=
	local uflag=

	for i in "$@"
	do
		case $i in 
		-red|-green|-yellow|-blue|-purple|-cyan)
			escape=${escape}${_MyColors[$i]}
			if [ "$bflag" != "" ]
			then
				escape=${escape}";"${_MyBold}	
			fi
			if [ "$uflag" != "" ]
			then
				escape=${escape}";"${_MyUnderline}
			fi
			;;
		-b)
			bflag=1		#Bold flag
			;;

		-n)
			nflag=-n	#No newline flag
			;;
		-u)
			uflag=1
			;;
		*)
			string=$i
			break
			;;
		esac

		if [ "$escape" != "" ]
		then
			escape=${escape}';'
		fi
	done

		
	if [ "$escape" != "" ]
	then
		escape=$(echo $escape | sed 's/;$/m/')
		echo -e  $nflag  ${_MyBase}"$escape""$string""\033[0m"
	else
		echo $nflag $string
	fi
	return
}

