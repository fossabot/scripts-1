# displays the time in H/M/S format
# credit: Stéphane Gimenez
# https://unix.stackexchange.com/a/27014
function displaytime {
	local T=$1
	local D=$((T/60/60/24))
	local H=$((T/60/60%24))
	local M=$((T/60%60))
	local S=$((T%60))
	(( $D > 0 )) && printf '%d days ' $D
	(( $H > 0 )) && printf '%d hours ' $H
	(( $M > 0 )) && printf '%d minutes ' $M
	(( $D > 0 || $H > 0 || $M > 0 )) && printf 'and '
	printf '%d seconds\n' $S
}

function pause(){
   read -p "$*"
}

#pause 'Press [Enter] key to continue...'

# define how long the timer shall go
minute=60
time=$(($1 * minute))

# find vertical center
vert_cent=$((`tput lines` / 2))
# find horizontal center
horizl_cent=$((`tput cols` / 2-10))

# find vertical center
# handles displaying and refreshing the time
while [ $time -gt 0 ]
do
	
	tput cup $vert_cent $horizl_cent && echo $(displaytime $time)
	
	sleep 1
	
	: $((time--))
done

clear

# visual feedback
tput cup $vert_cent $horizl_cent && echo "	### DONE ###	"
# macOS only command, audio feedback uncomment if wanted
say Done

# Let the user realize the timer is done
sleep 1

clear
