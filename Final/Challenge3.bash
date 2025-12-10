#!/bin/bash

outfile="report.html"

echo "<html><body>" > $outfile
echo "<h3>Access logs with IOC indicators:</h3>" >> $outfile
echo "<table border=\"1\">" >> $outfile

while read ip dt page; do
	echo "<tr><td>$ip</td><td>$dt</td><td>$page</td></tr>" >> $outfile
done < report.txt

echo "</table></body></html>" >> $outfile
sudo mv $outfile /var/www/html
