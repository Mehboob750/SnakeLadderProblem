#!/bin/bash -x
position=0;
player1=$position;
noPlay=0;
ladder=1;
snake=2;
winningPosition=100;
diceCounter=1;
function ladder(){
	position=$((1+RANDOM%6));
	#tempResult=$(($player1+$positon));
	if (( $(($player1+$position)) > $winningPosition ))
	then
		player1=$(($player1+0));
		positionArray[((diceCounter++))]=$player1;
	else
		player1=$(($player1+$position));
		positionArray[((diceCounter++))]=$player1;
	fi
}

function snake(){
	position=$((1+RANDOM%6));
        if (( $player1 > $position ))
        then
       		player1=$(($player1-$position))
		positionArray[((diceCounter++))]=$player1;
        else
        	player1=$(($player1 + 0));
		positionArray[((diceCounter++))]=$player1;
        fi
}

while (( $player1 != $winningPosition))
do
	option=$((RANDOM%3));
	case $option in
		$noPlay )
			player1=$(($player1 + 0));
			;;

		$ladder )
			ladder
			;;

		$snake )
			snake
			;;
		* )
			echo "Invalid Selection"
			;;
	esac
done

echo $player1;
echo "Total number of dies to win the game: " ${#positionArray[@]};
echo "Position of the player after each die Roll: " ${positionArray[@]};
