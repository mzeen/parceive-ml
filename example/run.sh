#!/bin/bash
for variance in {1..3}
do
    for ntasks in 10 50 100 200 500
    do    
        for weight in 10 50 100 200 500
        do
            ./test_example $variance $ntasks $weight
            
        done 
    done  
done
