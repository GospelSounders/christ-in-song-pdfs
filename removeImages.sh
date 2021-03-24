#!/bin/bash

SOURCE_DIR="htmlFiles"

# ls "$SOURCE_DIR" |grep '.pdf'
# exit
CWD=$(pwd)
mkdir -p htmlFilesNoImages

for file in $(ls "$SOURCE_DIR" |grep '.html$'); do 
    echo "$file"
    if test -f "$CWD/htmlFilesNoImages/$file"; then
        echo "$file exists."
    else
        ./removeImages.js "htmlFiles/$file" "htmlFilesNoImages/$file"
        git add .
        git commit -m "$file"
        GIT_SSH_COMMAND='ssh -i /tmp/gitkey -o IdentitiesOnly=yes' git push origin master
    fi
done