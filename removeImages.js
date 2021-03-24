#!/usr/bin/node
const fs = require('fs');

let file = process.argv[2];
let outputFile = process.argv[3];

const htmlContent = fs.readFileSync(file,  "utf8").replace(/<img.*\/>/g,'');
try{
fs.writeFileSync(outputFile, htmlContent, "utf8");

console.log('written to '+outputFile)
}catch(err){

}