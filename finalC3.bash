#!/bin/bash

# Define the input and output file paths
inputFile="report.txt"
outputFile="/var/www/html/report.html"

# Start the HTML file
echo "<html><body><table>" > $outputFile

# Read the input file line by line
while IFS= read -r line
do
  echo "<tr><td>$line</td></tr>" >> $outputFile
done < "$inputFile"

# Close the HTML tags
echo "</table></body></html>" >> $outputFile
