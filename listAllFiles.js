#!/usr/bin/node
const fs = require('fs');

const directoryPath = 'htmlFiles';
let filesList = [];
//passsing directoryPath and callback function
fs.readdir(directoryPath, function (err, files) {
    //handling error
    if (err) {
        return console.log('Unable to scan directory: ' + err);
    } 
    //listing all files using forEach
    files.forEach(function (file) {
        filesList.push(file);
        // Do whatever you want to do with the file
        // console.log(file); 
    });
    fs.writeFileSync('allHymns.json', JSON.stringify(filesList),"utf-8")
    console.log(filesList)
});