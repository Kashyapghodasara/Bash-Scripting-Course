read -p "Enter Number 1 : " a
read -p "Enter Sign (+, -, x, /) : " opt
read -p "Enter Number 2 : " b

case $opt in

	+)
		echo `expr $a + $b`
		;;
		
	-)
		echo `expr $a - $b`
		;;
		
	x)
		echo $(($a * $b))
		;;
		
	/)
		echo `expr $a / $b`
		;;
		
	*)
		echo "Expression not found"
		;;
		
esac
