read -p "Enter Student Name : " name
echo "========== Enter 5 Subjects Mark : =========="

read -p "English : " eng
read -p "Hindi : " hin
read -p "History : " his
read -p "Geomatery : " geo
read -p "Mathematics : " math

total_mark() {
		
		echo " "
		echo " "
		echo "======== $name ========"
		echo " "
		echo "-=-=-=-= RESULT =-=-=-=-"
		
		echo "English   :   $eng"
		echo "Hindi     :   $hin"
		echo "History   :   $his"
		echo "Geomatery :   $geo"
		echo "Maths     :   $math"
		
		
		res=$(( eng+hin+his+geo+math ))
		echo "            ---------"
		echo "Total Marks = $res"
		
		echo "------------------------"
		
		per=$(( res/5 ))
		echo "Percentage = $per %"
		
		echo "------------------------"
		
		if [[ per -gt 90  ]]
		then 
			echo "++++++++++  Grade A  ++++++++++"
		
		elif [[  per -gt 80 && per -le 90 ]]
		then
			echo "++++++++++  Grade B  ++++++++++"
		
		elif [[ per -gt 65 && per -le 80 ]]
		then
			echo "++++++++++  Grade C  ++++++++++"
			
		elif [[ per -gt 50 && per -le 65 ]]
		then
			echo "++++++++++  Grade D  ++++++++++"
		
		elif [[ pre -gt 35 && per -le 50 ]]
		then
			echo "++++++++++  Grade E  ++++++++++"
			
		elif [[ pre -le 35 ]]
		then
			echo "----------  F A I L  -----------"
			
		else
			echo "Unknown"
		fi

}


empty_data() {
	
	has_error=false
	
	if [ -z "$name" ]
	then
		echo "ERROR  **********Name is Empty**********"
		has_error=true

	elif [[ ${#name} -ge 25 ]]
	then
		echo "ERROR  **********Too long Name**********"
		has_error=true
		
	else 
		# For Numeric Only
		#numeric=true
		

		for i in "$eng" "$hin" "$his" "$geo" "$math"
		do
			if [[ -z "$i" || ! $i =~ ^[0-9]+$ ]]
			then
				#numeric=false
				echo "ERROR **********Not Numeric Value or Missing Value **********"
				has_error=true
				break
		
			elif [[ $i -gt 100 || $i -lt 0 ]]
			then
				echo "ERROR  **********Should be between 0 and 100 **********"
				has_error=true
				break
			fi
		done
	fi	
	
	if [ "$has_error" = false ]
	then
		total_mark
	fi
}

empty_data




