#!/bin/bash -x
position=0;
player1=$position;

noPlay=0;
ladder=1;
snake=2;
option=$((RANDOM%3));
case $option in
	$noPlay )
		player1=$(($player1 + 0));
		;;

	$ladder )
		position=$((1+RANDOM%6));
		player1=$(($player1+$position))
		;;

	$snake )
		if (( $player1 > 0 ))
		then
			position=$((1+RANDOM%6));
			player1=$(($player1-$position))
		else
			player1=$(($player1 + 0));
		fi
		;;
	* )
		echo "Invalid Selection"
		;;
esac
