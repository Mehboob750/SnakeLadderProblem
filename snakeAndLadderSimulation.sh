#!/bin/bash -x
position=0;
player1=$position;
noPlay=0;
ladder=1;
snake=2;
winningPosition=100;

function ladder(){
	position=$((1+RANDOM%6));
	#tempResult=$(($player1+$positon));
	if (( $(($player1+$position)) > $winningPosition ))
	then
		player1=$(($player1+0));
	else
		player1=$(($player1+$position));
	fi
}

function snake(){
	position=$((1+RANDOM%6));
        if (( $player1 > $position ))
        then
       		player1=$(($player1-$position))
        else
        	player1=$(($player1 + 0));
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
