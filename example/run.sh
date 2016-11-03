#!/bin/bash
for variance in {1..3}
do
    for ntasks in 10 50 100 200 500
    do    
        for weight in 10 50 100 200 500
        do
            pin -t ~/workspace/parceive/dc_cpp/release/lib/libParceive.so -db test_example_${variance}_${ntasks}_${weight}.db -f filter.xml -mode emulate  -- ./test_example $variance $ntasks $weight
        done 
    done  
done
