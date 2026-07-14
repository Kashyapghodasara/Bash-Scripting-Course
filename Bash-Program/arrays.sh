# Index Array

declare -a arr
arr=('My' 'Name' 'is' 'Batman' 15)

echo "Access Single Value : " ${arr[1]} 
echo ${arr[4]}

#Two way to accesing whole array
echo "Accessing Whole Array : " ${arr[@]}
echo ${arr[*]}

echo "Keys : " ${!arr[@]}
echo "Length : " ${#arr[@]}

unset arr[4]
echo ${arr[@]}

# unset arr => delete whole array

echo ------------

# Associative Array

declare -A arr1
arr1=(
	[first]='Hello'
	[second]='How Are'
	[third]='you'
)

echo ${arr1[first]}
echo ${arr1[@]}
echo ${arr1[*]}

echo "Length : " ${#arr1[@]}
echo "Keys : " ${!arr1[@]}
