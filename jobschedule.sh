#!/bin/bash

interpreter="/home/rupeshkepler/Documents/rupesh_github/bash_scripting//venv/bin/python"

path="/home/rupeshkepler/Documents/rupesh_github/bash_scripting/testing_bash/"


($interpreter $path/problem1.py > $path/problem1.log;
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
