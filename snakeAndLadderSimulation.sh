#!/bin/bash -x
position=0;
#player=$position;
noPlay=0;
ladder=1;
snake=2;
winningPosition=100;
diceCounter=1;
diceRollPCount=1;
function ladder(){
	position=$((1+RANDOM%6));
	#tempResult=$(($player1+$positon));
	if (( $(($player+$position)) > $winningPosition ))
	then
		player=$(($player+0));
		positionArray[((diceCounter++))]=$player;
	else
		player=$(($player+$position));
		positionArray[((diceCounter++))]=$player;
	fi
	echo $player;
}

function snake(){
	position=$((1+RANDOM%6));
   if [[ $player -gt $position ]]
   then
   	player=$(($player-$position))
		positionArray[((diceCounter++))]=$player;
	else
   	player=$(($player + 0));
		positionArray[((diceCounter++))]=$player;
	fi
  echo $player;
}

function checkNoplayLadderSnake(){
		option=$((RANDOM%3));
		case $option in
			$noPlay )
				player=$(($player + 0));
			   echo $player;
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
}

function displayWinPOsition(){
	echo $player;
	echo "Total number of dice roll to win the game: " ${#positionArray[@]};
	echo "Position of the player after each die Roll: " ${positionArray[@]};
}


#playe for multiple players
#player1=0;
#player2=0;

while [[ $player1 -ne $winningPosition || $player2 -ne $winningPosition ]]
do
	if (( $(($diceRollPCount%2)) == 0 ))
	then
		player1="$( checkNoplayLadderSnake $player1 )";
		(( diceRollPCount++ ));

		sleep 5s;
	else
		player2="$( checkNoplayLadderSnake $player2 )"
		(( diceRollPCount++ ));
		sleep 5s;
	fi
done

if (( $player1 == $winningPosition ))
then
	echo "Player1 win!!!";
else
	echo "Player2 win!!!";
fi
