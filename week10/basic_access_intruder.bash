#!/bin/bash
website="http://10.0.17.31/"
for i in {1..20}; do
	curl "$website"
done
echo "$website" 
