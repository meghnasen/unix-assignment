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
if [ "$ch" -eq 4 ]
then
        echo "clear phonebook selected"
        break
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
