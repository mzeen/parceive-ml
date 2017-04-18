#!/bin/bash
for variance in {1..3}
do
    for ntasks in 10 50 100 200
    do    
        for weight in 10 50 100 200
        do
            TEST="test_example_${variance}_${ntasks}_${weight}" 
            /shared/pin-2.14/intel64/bin/pinbin -injection child -t /shared/parceive/dc_cpp/release/lib/libParceive.so -db ${TEST}.db -f filter.xml -variable false -loop on -sourcelocation false  -- ./test_example $variance $ntasks $weight
            sqlite3 -header -csv  ${TEST}.db < calls.sql > ${TEST}.csv
            sqlite3 -csv ${TEST}.db < loopcalls.sql >> ${TEST}.csv
        done 
    done  
done
