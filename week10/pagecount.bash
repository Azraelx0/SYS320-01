#!/bin/bash

function pageCount(){
	file="/var/log/apache2/access.log"
	local pages=$(cat "$file" | cut -d' ' -f7 | sort -n | uniq -c)
	echo "$pages"	
}
#pageCount
function countingCurlAccess(){
	file="/var/log/apache2/access.log"
        local pages=$(grep "curl" "$file" | cut -d' ' -f1,12 | sort -n | uniq -c)
        echo "$pages"
}
countingCurlAccess

