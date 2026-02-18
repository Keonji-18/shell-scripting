#/bin/bash
#Start of for loop
for a in 1 2 3 4 5 6 7 8 9 10
do

	if [ $a == 5 ]
	then	
		echo "Contine statement"
		continue
	elif [ $a == 8 ]
	then 
		echo "Break statement"
		break
	fi
	echo "iteration $a"

done
