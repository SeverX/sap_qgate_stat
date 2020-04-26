# Q-Gate-SAP
Statistics of ABAP Test Cockpit with R, version 1.0

This R project is a try to bring more statistics into Q-Gate process for ABAP developments.

In order to use this script you need to carry out ATC (ABAP Test Cockpit) on any level (supposedly the main package of your development).
After that you need to download results like spreadsheet with XLSX format. In the script it's assumed that file has name ATC.xlsx

The next you need to start R-Studio and run this script.

As results of this script you'll get:
- How many errors have been appeared for assigned objects' owners
- Detailed view of errors for every owner of objects
- How many errors on every package level
