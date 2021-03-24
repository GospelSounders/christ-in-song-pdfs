#!/bin/bash

BIGFILESPATH='./ArchiveFiles/'
cd $BIGFILESPATH
files=(*)
files=(*.pdf) # pdf files

printf "%s\n" "${files[@]}"

volume=0
prevNum=1
num=1
while IFS= read -r line
do
num=$(echo "$line"|cut -d":" -f2- |cut -d"," -f-1)
if [ "$num" -lt "$prevNum" ]; then
    let volume++
fi
let prevNum=num
whichFile=${files[$volume]}
#echo $whichFile
#  echo "$line---->$num--->$volume"
pages=$(echo $line|cut -d":" -f2-)
#echo $pages
IFS=',' read -r -a array <<< "$pages"
startPage=${array[0]}
for element in "${array[@]}"
do
    endPage="$element"
done
hymnNum=$(echo "$line"|cut -d":" -f-1 ) 
echo "$hymnNum---->$num--->$whichFile::::$startPage=>$endPage" 
#qpdf --pages "$whichFile" "$startPage-$endPage" -- "$whichFile" "../splitFiles/$hymnNum.pdf"
pdfjam  "$whichFile" "$startPage-$endPage" -o "../splitFiles/$hymnNum.pdf"  
done < finalList
