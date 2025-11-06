#!/bin/bash

function pageCount(){
	file="/var/log/apache2/access.log"
	pages=$(cat "$file" | cut -d' ' -f7 | sort -n | uniq -c)
	echo "$pages"	
}
pageCount
