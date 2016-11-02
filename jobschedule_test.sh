#!/bin/bash

interpreter="/home/rupeshkepler/Documents/rupesh_github/bash_scripting//venv/bin/python"

path="/home/rupeshkepler/Documents/rupesh_github/bash_scripting/testing_bash/"

check_job1=$( grep "success*" $path/status1.txt )
check_job2=$( grep "success*" $path/status2.txt )
check_job3=$( grep "success*" $path/status3.txt )

echo $check_job1
echo $check_job2
echo $check_job3

(if [[ "$check_job1" != success* ]];
then
    ($interpreter $path/problem1.py > $path/problem1.log;
     RESULT1=$?
     echo $RESULT1'job1'

     if [ $RESULT1 -eq 0 ];
     then
         echo 'success1' $(date) > $path/status1.txt
     else
         echo 'error1' $(date) > $path/status1.txt
     fi
    )
else
    echo 'job1 ran before successfully' $(date)
 fi)&
(if [[ "$check_job2" != success* ]];
then
    ($interpreter $path/problem2.py > $path/problem2.log;
     RESULT2=$?
     echo $RESULT2'job2'

     if [ $RESULT2 -eq 0 ];
     then
         echo 'success2' $(date) > $path/status2.txt
     else
         echo 'error2' $(date) > $path/status2.txt
     fi
    )
else
    echo 'job2 ran before successfully' $(date)
fi)

wait

check1=$( grep "error*" $path/status1.txt )
check2=$( grep "error*" $path/status2.txt )
echo $check1
echo $chekc2

if [[ "$check1" =~ error* ]] || [[ "$check2" =~ error* ]];
then
    echo 'leve1 jobs failed and we cant run this job' $(date) > $path/status3.txt
elif [[ "$check_job3" != success* ]];
then
    $interpreter $path/problem3.py > $path/problem3.log;
    RESULT4=$?

    if [ $RESULT4 -eq 0 ];
    then
        echo 'success3' $(date) > $path/status3.txt
    else
        echo 'error3' $(date) > $path/status3.txt
    fi
else
    echo 'job 3 ran successfully before after running 1&2' $(date)
fi
wait

echo 'workflow completed' $(date)
