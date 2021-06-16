BOOK="phonebook_values.txt"
 
export BOOK
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
        echo "add entry selected"
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
        break
fi
if [ "$ch" -eq 2 ]
then
        echo "display entries selected"
        break
fi
if [ "$ch" -eq 3 ]
then
        echo "remove  entry selected"
        break
fi
if [ "$ch" -eq 4 ]
then
        echo "clear phonebook selected"
        break
fi
if [ "$ch" -eq 5 ]
then
        echo "display entry acc to name selected"
fi
if [ "$ch" -eq 6 ]
then
        exit=1
fi
done
exit 0
