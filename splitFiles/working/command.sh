#!/bin/bash

doFirstStep=${1:-"NONE"}
if [[ "$doFirstStep" != "NONE" ]]; then
    numFiles=$(ls ../*.pdf | wc -l)
    fileNum=${1:-0}
    [[ "$fileNum" == "ALL" ]] && fileNum=$numFiles
    echo $fileNum
    index=0
    for fileName in $(ls ../*.pdf); do
        # firstFileName=$fileName
        # cp "$firstFileName" "working/"
        file=$(echo "$fileName" | sed "s/.*\///")

        # node index.js $file
        echo $file
        node index.js $file
        
        [[ "$index" -eq "$fileNum" ]] && break;
        let index++
    done
fi
# cd working
# pwd
