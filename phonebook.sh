#!/bin/bash
phoneBook="phonebook_values.txt"
exit=0
clear
while [ $exit -ne 1 ]
do
echo "Select an operation"
        echo "1.Add Entry"
        echo "2.Display All Entries"
        echo "3.Remove Entries acc. to Name"
        echo "4.Clear Phonebook"
        echo "5.Display Entries acc. to Name"
        echo "6.Exit"
        read ch
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
echo $name
echo "Enter a phone number[10 digits]: "
read phoneNumber
pat="^[0-9]{10}$"
while [[ ! $phoneNumber =~ $pat ]]
    do
    echo "Please enter a valid phone number: "
    read phoneNumber
    done
echo $phoneNumber
        echo "$name:$phoneNumber" >>  $phoneBook
        cat $phoneBook
        break
fi
if [ "$ch" -eq 2 ]
then
        echo "DISPLAY PHONEBOOK:"
        cat phonebook_values.txt
        break
fi
if [ "$ch" -eq 3 ]
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
        sed -i "/$phone/d" $phoneBook
        cat $phoneBook
        echo "the phone number has been deleted"
        break
fi
if [ "$ch" -eq 4 ]
then
        echo "CLEAR PHONEBOOK:"
        echo "Are you sure you want to clear the phone book: [y/n]"
        read choice
        if [ $choice == "y" -o $choice == "Y" ]
        then
        cp /dev/null $phoneBook
        echo "The phonebook has been cleared"
        fi
        if [ $choice == "n" -o $choice == "N" ]
        then 
        break
        fi
        break
fi
if [ "$ch" -eq 5 ]
then
        echo "DISPLAY ENTRY ACC. TO NAME"
        echo "Enter a name: "
        read option
while [ -z $option ]
    do
    echo "please enter a name: "
    read option
    done
        echo The available phone records are:
        grep $option $phoneBook
fi
if [ "$ch" -eq 6 ]
then
        exit=1
fi
done
exit 0
