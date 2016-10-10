#!/bin/bash

for i in {1..100}; do
    if [$((i%3)) -eq 0]; then
        echo 'fizz'
    elif [$((i%5)) -eq 0]; then
        echo 'bizz'
    fi
done
