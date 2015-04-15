#!/bin/bash

# This script will run the graph 500 benchmarc for different scales and it saves the results to
# a file for that scale. 

RED='\033[0;31m'
NC='\033[0m' # No Color


echo "Performing analysis on hybrid"
# Running on hybrid
for SCALE in {14..21}
do
        echo -e "[BASH] ${RED} Running the Hybrid graph500 for scale $SCALE ${NC}"
        echo "[BASH] Running the Hybrid graph500 for scale $SCALE" > ./out/HYB_HC_s$SCALE.txt
	echo "[BASH] Using Partitioning Algorithm: High Degree nodes on CPU"
        ../graph500 -s$SCALE -o /local/tmp/edgelist$SCALE -t "-p2 -i1" >> ./out/HYB_HC_s$SCALE.txt

        #./graph500 -s$SCALE -t "-p2" > tmp.txt
        #cat tmp.txt | tee >(head -10 >> TMP_HYB_s$SCALE.txt) | tail -30 >> TMP_HYB_s$SCALE.txt

done 


for SCALE in {14..21}
do
        echo -e "[BASH] ${RED} Running the Hybrid graph500 for scale $SCALE ${NC}"
        echo "[BASH] Running the Hybrid graph500 for scale $SCALE" > ./out/HYB_LC_s$SCALE.txt
        echo "[BASH] Using Partitioning Algorithm: Low Degree nodes on CPU"
        ../graph500 -s$SCALE -o /local/tmp/edgelist$SCALE -t "-p2 -i2" >> ./out/HYB_LC_s$SCALE.txt

        #./graph500 -s$SCALE -t "-p2" > tmp.txt
        #cat tmp.txt | tee >(head -10 >> TMP_HYB_s$SCALE.txt) | tail -30 >> TMP_HYB_s$SCALE.txt

done 

