const shelljs = require('shelljs');
const fse = require('fs-extra');
const PDFExtract = require('pdf.js-extract').PDFExtract;
const pdfExtract = new PDFExtract();
const options = {}; /* see below */
let pdfFile = process.argv[2];


console.log(process.argv)


pdfExtract.extract(`../${pdfFile}`, options, (err, data) => {
  if (err) return console.log(err);
  console.log(data);
  console.log(data.pages[0].content);
  let dat = '';
  data.pages.map(page =>
    page.content.map(line => {
      dat = `${dat}\n${line.str}`
    })
  )
  console.log('----------|||pdf----------------')
  console.log(dat)
  fse.writeFile(`working/${pdfFile}.md`, dat)
  console.log(pdfFile);
});