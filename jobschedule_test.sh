#!/bin/bash

interpreter="/home/rupeshkepler/Documents/rupesh_github/bash_scripting//venv/bin/python"

path="/home/rupeshkepler/Documents/rupesh_github/bash_scripting/testing_bash/"

rm $path/status.txt

($interpreter $path/problem1.py > $path/problem1.log;
RESULT1=$?
echo $RESULT1'job1'

if [ $RESULT1 -eq 0 ];
then
    echo 'success1' >> $path/status.txt
else
    echo 'error1' >> $path/status.txt
fi
) &

($interpreter $path/problem2.py > $path/problem2.log;
 RESULT2=$?
 echo $RESULT2'job2'

 if [ $RESULT2 -eq 0 ];
 then
     echo 'success2' >> $path/status.txt
 else
     echo 'error2' >> $path/status.txt
 fi
)

wait

check1=$( grep "error*" $path/status.txt )
echo $check1

if [[ "$check1" =~ error* ]];
then
    echo 'leve1 jobs faild' >> $path/status.txt
else
    $interpreter $path/problem3.py > $path/problem3.log;
    RESULT4=$?

    if [ $RESULT4 -eq 0 ];
    then
        echo 'success3' >> $path/status.txt
    else
        echo 'error3' >> $apth/status.txt
    fi
fi


echo 'workflow completed'








:'
if [ $? == 0 ];
then
    output1=0
else
    output1=1
fi
) &

($interpreter $path/problem2.py > $path/problem2.log;
 if [ $? == 0 ];
 then
    output2=0
 else
    output2=1
 fi
);

wait
echo $output1
echo $output2

if
    [ $output1==0 ] && [ $output2==0 ] ;
then
    $interpreter $path/problem3.py > $path/problem3.log;
    if [ $? == 0 ];
       then
           output3=0
       else
           output3=1
    fi
fi

wait
echo $output3
'
