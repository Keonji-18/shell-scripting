#!/bin/bash
#While loop

a=1

while [ $a -lt 10 ]
do
        echo "Iteration $a"
        a=`expr $a + 1`

done
