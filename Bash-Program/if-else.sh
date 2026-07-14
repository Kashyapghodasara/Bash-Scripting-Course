read -p "Number 1 : " a
read -p "Number 2 : " b

#if [ $a -gt $b ]

if [[ $a -eq 20 && $b -eq 10 ]]
then
	echo "$a is 20 and $b is 10"
else
	echo "Both are different"
fi
