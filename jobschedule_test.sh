#!/bin/bash

interpreter="/home/rupeshkepler/Documents/rupesh_github/bash_scripting//venv/bin/python"

path="/home/rupeshkepler/Documents/rupesh_github/bash_scripting/testing_bash/"

check_job1=$( grep "success*" $path/status1.txt )
check_job2=$( grep "success*" $path/status2.txt )
check_job3=$( grep "success*" $path/status3.txt )
check_job4=$( grep "success*" $path/status4.txt )
check_job5=$( grep "success*" $path/status5.txt )

echo $check_job1
echo $check_job2
echo $check_job3
echo $check_job4
echo $check_job5

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

check3=$( grep "error*" $path/status3.txt )
echo $check3

if [[ "$check3" =~ error* ]];
then
    echo 'level 2 jobs failed and we  cant run this job' $(date)
elif [[ "$check_job4" != "success*" ]];
then
    $interpreter $path/problem4.py > $path/problem4.log;
    RESULT5=$?

    if [ $RESULT5 -eq 0 ];
    then
        echo 'success4' $(date) > $path/status4.txt
    else
        echo 'error4' $(date) > $path/status4.txt
    fi
else
    echo 'job 4 ran successfully after running level 2 jobs' $(date)
fi

check4=$( grep "error*" $path/status4.txt )
echo $check4

#wait

if [[ "$check4" =~ error* ]];
then
    echo 'level 3 job failed  and we cant run this job' $(date) > $path/status5.txt
elif [[ "$check_job5" != "success*" ]];
then
    $interpreter $path/problem5.py > $path/problem5.log;
    RESULT6=$?

    if [ $RESULT6 -eq 0 ];
    then
        echo 'success5' $(date) > $path/status5.txt
    else
        echo 'error5' $(date) > $path/status5.txt
    fi
else
    echo 'job 5 ran successfully after completing level 3 jobs' $(date)
fi

wait

echo 'workflow completed' $(date)
