# Project 2 == Random Number Guess

#!/bin/bash

echo "=== Welcome to Number Guessing Game ==="
echo "You have to guess number from 1 to 100 and system will tell how far and near you are."
echo "-----------------------------"

echo "Guessing Number is ....."
echo "> 30 count = Too Large"
echo "5 < 30 count = Large"
echo "< 5 count = Nearly Large"

echo "~~~~~~~~~"
echo "~~~~~~~~~"

echo "> 30 count = Too Small"
echo "5 < 30 count = Small"
echo "< 5 count = Nearly Small"

echo "======================================="
echo "⬆ Tells you to raise your guess"
echo "⬇ Tells you to decrease your guess"
echo "======================================="


num=$(( $RANDOM % 100 ))
ans=false
attempt=0 # Don't declare attmpets in while loop because it reset it to 0 every time


while [ "$ans" = false ]
do
	
	attempt=$((attempt+1))
	read -p "Enter your Number : " a
	
	if [[ $a -eq $num ]]
	then
		echo "Correct ! You guessed the number"
		echo "Attempt : $attempt"
		ans=true
	
	else 
		if [[ $a -gt $num && $a -ne $num ]]
		then
			count=$(( a - num))
			if [[ $count -ge 30 ]]
			then
				echo "Too Large Guess ⬇⬇⬇"
			
			elif [[ $count -gt 5 && $count -lt 30 ]]
			then
				echo "Large Guess ⬇⬇"
				
			elif [[ $count -le 5 ]]
			then
				echo "Nearly Large ⬇"
			fi
		
		else
			if [[ $a -lt $num && $a -ne $num ]]
			then
				count=$(( num - a ))
				if [[ $count -ge 30 ]]
				then
					echo "Too Small Guess ⬆⬆⬆"
			
				elif [[ $count -gt 5 && $count -lt 30 ]]
				then
					echo "Small Guess ⬆⬆"
					
				elif [[ $count -le 5 ]]
				then
					echo "Nearly Small ⬆"
				fi
			fi
		fi
	fi
done
