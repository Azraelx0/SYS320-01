#!/bin/bash

# List all IPs in the given network prefix
# /24 only

# Usage: Bash IPList.bash 10.0.17
[[ $#  -ne 1 ]] && echo "Usage: $0 <Prefix>" && exit 1

# Prefix is first input taken
prefix=$1

# Verify input length
[[ ${#prefix}  -lt 5 ]] && \
printf "Prefix length is too short\nPrefix example: 10.0.17\n" && \
exit 1 

for i in {0..254}
do 
#	echo $prefix.$i  #comment out to run next lines otherwise keep
	
	ping -c 1 $prefix.$i | grep "64 bytes" | \
	grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
done
