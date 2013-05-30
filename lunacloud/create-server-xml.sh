#!/bin/bash
START=1
STOP=2
NAME="name" 
STATIC_FILE="static-create.xml"
OUTPUT_FILE="cserver" 

for ((i==$START;i!=($STOP+1);i++)) ; do
printf "%b" "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<ve>\n\t<name>$NAME$i</name>\n" \
> temp.xml
cat temp.xml $STATIC_FILE > config/$OUTPUT_FILE${i}.xml
done
	

