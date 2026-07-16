# Project 3 - Contact Book

#!/bin/bash

echo "======== List Contacts ========"

echo "1. Add Contact"
echo "2. View All Contacts"
echo "3. Search Contact"
echo "4. Delete Contact"

echo "==============================="

echo "Press 1, 2, 3, 4 for Processing : "

echo "==============================="

# -- Self Understanding --
# name - 123456
# array = name
# array = number
# both on same index
# view = for loop both contacts
# search by name = for loop on name and find its number index

read -p "Enter Step Number : " step


declare -a cont_name
declare -a cont_num

# Function 1
add_name() {
	
	echo "=*=*=*=*=*=*= Step 1 :- Add Contact =*=*=*=*=*=*="
	
	read -p "Enter Full Name : " name
	read -p "Enter Phone Number : " num
	
	if [[ ! -z "$name" && ! -z "$num" ]]
	then
		if [[ ${#num} -eq 10 && ${#name} -le 20 ]]
		then
			cont_name+=("$name")
			cont_num+=("$num")
		
			
			echo " "
			echo ":::::::: Contact Added Successfully ::::::::"
			
			for i in "${!cont_name[@]}"
			do
				# echo "$i"
				# echo "${cont_name[$i]}"
				# echo "${cont_num[$i]}"
				
				echo "${cont_name[$i]},${cont_num[$i]}" >> file.txt 
			done
		fi
	fi
}


view_contact() {

	while IFS=',' read -r name number
	do
		cont_name+=("$name")
		cont_num+=("$number")
	done < file.txt
	
	echo " "
	echo "=*=*=*=*=*=*= Step 2 :- View All Contacts =*=*=*=*=*=*="
	echo " "

	for i in "${!cont_name[@]}"
	do
		echo " "
		echo "Name       : ${cont_name[$i]}"
		echo "Ph. Number : ${cont_num[$i]}"
		echo "--------------------------------"
	done
}


search_contact() {

	while IFS=',' read -r name number
	do
		cont_name+=("$name")
		cont_num+=("$number")
	done < file.txt
	
	echo " "
	echo "=*=*=*=*=*=*= Step 3 :- Search Contact =*=*=*=*=*=*="
	echo " "
	
	read -p "Enter Name : " a
	
	if [[ ! -z "$a" ]]
	then
		# echo "$a"
		# echo "${cont_name[@]}"
		contact_found=false
		
		for i in "${!cont_name[@]}"
		do
			if [[ "$a" = "${cont_name[$i]}" ]]
			then
				echo "---------------------------------"
				echo "Name       : ${cont_name[$i]}"
				echo "Ph. Number : ${cont_num[$i]}"
				echo "---------------------------------"
				contact_found=true
				break
			else
				contact_found=false
			fi	
		done

		if [[ "$contact_found" = false ]]
		then
			echo "----- Error : No Contact Found -----"
		fi
		
	else
		echo "----- Error : Name is Empty -----"
	fi
	
}


delete_contact() {

    # Clear arrays first
    cont_name=()
    cont_num=()

    # Read file into arrays
    while IFS=',' read -r name number
    do
        cont_name+=("$name")
        cont_num+=("$number")
    done < file.txt

    echo " "
    echo "=*=*=*=*=*=*= Step 4 :- Delete Contact =*=*=*=*=*=*="
    echo " "

    read -p "Enter Name : " a

    contact_found=false

    if [[ -n "$a" ]]
    then
        for i in "${!cont_name[@]}"
        do
            if [[ "$a" == "${cont_name[$i]}" ]]
            then
                unset "cont_name[$i]"
                unset "cont_num[$i]"

                contact_found=true
                echo ":::::::: Contact Deleted Successfully ::::::::"
                break
            fi
        done

        if [[ "$contact_found" == true ]]
        then
            # It is used to empty the file
            > file.txt

            for i in "${!cont_name[@]}"
            do
                echo "${cont_name[$i]},${cont_num[$i]}" >> file.txt
            done

        else
            echo "----- Error : No Contact Found -----"
        fi
    else
        echo "----- Error : Name is Empty -----"
    fi
}

if [[ $step -eq 1 && ! -z "$step" ]]
then
	add_name

elif [[ $step -eq 2 && ! -z "$step" ]]
then
	view_contact

elif [[ $step -eq 3 && ! -z "$step" ]]
then
	search_contact
	
elif [[ $step -eq 4 && ! -z "$step" ]]
then
	delete_contact
	
else
	echo "----- Error : Unknow Step Action -----"
fi
