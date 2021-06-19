#! /bin/bash
#Consider a database which contains following fields: Roll number, name, semester and marks in mathematics. Write a menu driven shell script for
#(a)	adding a record
#(b)	deletion of a record corresponding to a roll number
#(c)	finding a record in a database corresponding to a roll number
#(d)	exit
#The shell script should accept a choice from the user and execute the corresponding option until exit option is chosen.

database_file="database"

# check file exist. if not leave program
if [ ! -f $database_file ]; then
	echo "Database file not found, Please create the file and try again..."
	exit
fi
insertRecord(){
        roll_number=""
        fName=""
        marks_maths=""
        semester=""

        echo "Please enter your roll number: "
        #The roll number must be at least 11 characters, Example: 2020HSxxxxx
        read roll_number

            while (( 1 ))
            do
                if [[ $roll_number =~ ^2020HS[0-9]{5}$ ]]; then
                  res="no"
                  res=`awk -F: -v var="$roll_number" '{if ($2 ~ var ) {print "yes";}}' "$database_file" `
                  if [[ $res =~ "yes" ]]; then
                    echo "This student entry already exists in database. Please enter valid input ,Example: 2020HSxxxxx"
                    read roll_number
                  else
                    break
                fi
                    break
                else
                    echo "The roll number must be at least 11 characters, Example: 2020HSxxxxx"
                    read roll_number
                fi


            done

        echo "You entered " "$roll_number"

        echo

        echo "Please enter your first name:"
        read fName
        while (( 1 ))
        do
            if [[ $fName =~ ^[A-Z][a-z]+$  ]]; then
                break
            else
                echo "Invalid format. first name should contain only alphabets. enter again. "
                read fName
            fi
        done
        echo "You entered " $fName
        echo

        echo

        echo "Please enter your marks in Mathematics: "
        read marks_maths

        while (( 1 ))
        do
            if [[ $marks_maths -gt 0 && $marks_maths -lt 100 ]]; then
                break
            else

                echo "Invalid format. Marks must be between 0 and 100. "
                read marks_maths
            fi
        done

        echo "You entered " $marks_maths

        echo

        echo "Please enter your semester: "
        read semester

        while (( 1 ))
        do
            if [[ $semester =~ ^[0-9]{1,}$ ]]; then
                break
            else
                echo "Invalid format. Semester should contain digits only. enter again. "
                read semester
            fi
        done

        echo "You entered " $semester

        echo

        newRecord=$fName" :"$roll_number":"$marks_maths":"$semester
        echo "The student record that is being inserted is: "
        echo "Student Roll Number: $roll_number"
        echo "Student Name: $fname"
        echo "Student Math Marks: $marks_maths"
        echo "Student Semester: $semester"
        echo " =============================="
        echo "$newRecord" >> "$database_file"

}

# infinite loop for menu
while (( 1 ))
do
  clear
  echo "----Main Menu----"
  echo "1 for Insert a record"
	echo "2 for Search for a record by Roll Number"
	echo "3 for Delete for a record by Roll Number"

	echo "0 for exit"
	read option

	case $option in
	"1")
		insertRecord
		echo "Press enter to continue"
    read
		;;
	"2")
		echo "Search for a record by Roll Number"
		echo "--------------------------------"
		echo "Enter the roll number you want to search: "
		read roll_number
		var=$(awk -v var="$roll_number" -F'[ :]' '{if ($3 ~ var) {print;} }' "$database_file")
		echo $var
		my_arr=($(echo "$var" | tr ":" "\n"))
		if [[ -n $var ]]
		then
		      printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

          echo -e "\t\t\t-------- Printing Record ------"
          echo -e "\t\t\tThe record is:"
          echo -e "\t\t\tName: ${my_arr[0]}"
          echo -e "\t\t\tRollnumber: ${my_arr[1]}"
          echo -e "\t\t\tMarks: ${my_arr[2]}"
          echo -e "\t\t\tSemester: ${my_arr[3]}"

          printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

    else
      echo "The record with that roll number was not found please try again"
    fi
    echo "Press enter to continue"
    read
		;;
	"3")
		echo "Delete for a record by Roll Number"
		echo "--------------------------------"
		echo "Enter the roll number you want to delete: "
		read roll_number
		echo "Records with Roll number: $roll_number"
		var=$(awk -v var="$roll_number" -F'[ :]' '{if ($3 ~ var) {print;} }' "$database_file")
	  my_arr=($(echo "$var" | tr ":" "\n"))
		if [ -n "$var" ]
		then
           printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

          echo -e "\t\t\t-------- Printing Record ------"
          echo -e "\t\t\tThe record is:"
          echo -e "\t\t\tName: ${my_arr[0]}"
          echo -e "\t\t\tRollnumber: ${my_arr[1]}"
          echo -e "\t\t\tMarks: ${my_arr[2]}"
          echo -e "\t\t\tSemester: ${my_arr[3]}"

          printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
    else
      echo "The record with that roll number was not found please try again"
      echo "Press enter to continue"
      read
      continue
    fi
		echo "deleting the record corresponding to rollnumber: $roll_number. New database file"
		awk -v var="$roll_number" -F'[ :]' '{if ($3 !~ var) {print;} }' "$database_file" > "temp"
		cp "temp" "$database_file"
		rm "temp"
		printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

		cat "$database_file"

		printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -

		echo "Press enter to continue"
    read
		;;
	"0")
		echo "Thanks for using the program. Bye!"
		break
		;;
	*)
		echo "Please input a valid input"
		;;
	esac

done

