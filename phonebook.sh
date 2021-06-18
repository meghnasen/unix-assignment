#                             Online Bash Shell.
#                 Code, Compile, Run and Debug Bash script online.
# Write your code in this editor and press "Run" button to execute it.


phoneBook="phonebook_values.txt"
exit=0
clear
while [ $exit -ne 1 ]
    do
        echo ""
        echo "Select an operation"
        echo "1.Add Entry"
        echo "2.Display All Entries"
        echo "3.Remove Entries according to Phone Number"
        echo "4.Clear Phonebook"
        echo "5.Display Entries according to Name"
        echo "6.Exit"
        echo ""
        read ch
        echo ""
        if [ "$ch" -eq 1 ]
        then
            echo "ADD A PHONE NUMBER:"
            echo "Enter a name: "
            read name
            while [ -z $name ]
            do
                echo "please enter a name: "
                read name
            done
            
            echo "Enter a phone number[10 digits]: "
            read phoneNumber
            pat="^[0-9]{10}$"
            while [[ ! $phoneNumber =~ $pat ]]
                do
                echo "Please enter a valid phone number: "
                read phoneNumber
            done
            if grep -q "$phoneNumber" "$phoneBook"
            then
                echo "Sorry, the number already exists"
            else
                echo "Entry added: "
                echo "$name:$phoneNumber" >>  $phoneBook
                cat $phoneBook
                
            fi
        elif [ "$ch" -eq 2 ]
        then
                echo "DISPLAY PHONEBOOK:"
                if [ -e phonebook_values.txt ]
                then
                    if [ -s phonebook_values.txt ]
                    then
                        cat phonebook_values.txt
                    else
                        echo "Sorry, there are no entries yet"
                    fi
                else 
                 echo "Sorry, there are no entries yet"
                fi
        elif [ "$ch" -eq 3 ]
        then
                echo "DELETE A PHONE NUMBER:"
                echo "Enter the phone number to be deleted: "
                read phone
                pat="^[0-9]{10}$"
                while [[ ! $phone =~ $pat ]]
                    do
                    echo "Please enter a valid phone number: "
                    read phone
                done
                if grep -q "$phone" "$phoneBook"
                then
                    sed -i "/$phone/d" $phoneBook
                    echo "the phone number has been deleted"
                    echo "remaining entries in the phonebook:"
                    cat $phoneBook
                else
                echo "Sorry, the number does not exist"
                fi
        elif [ "$ch" -eq 4 ]
        then
                echo "CLEAR PHONEBOOK:"
                echo "Are you sure you want to clear the phone book: [y/n]"
                read choice
                if [ $choice == "y" -o $choice == "Y" ]
                then
                    cp /dev/null $phoneBook
                    echo "The phonebook has been cleared"
                elif [ $choice == "n" -o $choice == "N" ]
                then
                    echo "Based on your decision, not clearing phonebook"
                else
                echo "Invalid choice. To clear phonebook, choose option from the main menu"
                
                fi
                
        elif [ "$ch" -eq 5 ]
        then
                echo "DISPLAY ENTRY ACCORDING TO NAME"
                echo "Enter a name: "
                read option
                while [ -z $option ]
                do
                    echo "please enter a name: "
                    read option
                done
                if grep -q "$option" "$phoneBook"
                then
                    echo The available phone records are:
                    grep $option $phoneBook
                else
                    echo "Sorry, there are no records available with this name."
                fi
        elif [ "$ch" -eq 6 ]
        then
                exit=1
        else
         echo "Invalid Input"
         
         fi
    
    done
exit 0