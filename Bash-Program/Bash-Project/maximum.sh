read -p "Enter Number 1 : " a
read -p "Enter Number 2 : " b
read -p "Enter Number 3 : " c


if [[ $a -eq $b && $b -eq $c && $a -eq $c ]]
then
	echo "All numbers are same"

elif [[ $a -ge $b && $a -ge $c ]]
then 
	echo "$a is Big"
	
elif [[ $b -ge $a && $b -ge $c ]]
then
	echo "$b is Big"
	
else 
	echo "$c is Big"
	
fi
