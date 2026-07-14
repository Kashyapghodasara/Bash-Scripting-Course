b=20

hello() {
	local a=15 
	res=$(( a + b ))
	
	echo "Result : $res"
	echo "Hello $1"
		
}

hello "Batman" # Command Line Arguments
