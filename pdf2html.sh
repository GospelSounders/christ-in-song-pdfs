CWD=$(pwd)
mkdir -p htmlFiles

for file in $(ls "$CWD/splitFiles"); do 
    echo "$file"
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo "$filename"
    if test -f "$CWD/htmlFiles/$filename.html"; then
        echo "$file exists."
    else
        cd splitFiles
        pdf2htmlEX "$file"
        mv "$filename.html" ../htmlFiles/
        cd .. 
        git add .
        git commit -m "html file $file"
        git push origin master
    fi
done
git add .
git commit -m "html files"
git push origin master